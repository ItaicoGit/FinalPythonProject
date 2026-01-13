import argparse
import boto3

def parse_args():   # Adding information
    parser = argparse.ArgumentParser(description="Platform CLI for AWS resources")
    parser.add_argument("resource", choices=["ec2", "s3", "route53"], type=str.lower, help="Resource type")
    parser.add_argument("action", choices=["create", "start", "stop", "update", "delete", "list", "upload"], type=str.lower, help="Action to perform")
    parser.add_argument("--name", help="Resource name")
    parser.add_argument("--type", help="Instance type for EC2 (t2.small/t3.micro)")
    parser.add_argument("--public", action="store_true", help="Make S3 bucket public")
    parser.add_argument("--system", help="Operating system for EC2 (Amazonlinux/Ubuntu)")
    parser.add_argument("--file", help="Path to file for upload")
    return parser.parse_args()

def get_ec2_clients():  # Region validation for ec2
    ec2 = boto3.client("ec2", region_name="us-east-1")
    return ec2

def get_s3_clients():  # Region validation for s3
    session = boto3.session.Session()
    region = session.region_name or 'us-east-1'
    s3 = session.client("s3", region_name=region)
    return s3, region

def get_route53_client():
    return boto3.client("route53")



def get_ami_id(ec2, system):    # AMI validation
    system = system.lower().replace(" ", "")
    owners = {
        "amazonlinux": "137112412989",
        "ubuntu": "099720109477"
    }
    names = {
        "amazonlinux": "amzn2-ami-hvm-*-x86_64-gp2",
        "ubuntu": "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
    }

    if system not in owners:    # System validation
        print("Error: Unknown system. Choose 'amazonlinux' or 'ubuntu'.")
        return None

    images = ec2.describe_images(
        Owners=[owners[system]],
        Filters=[{"Name": "name", "Values": [names[system]]}]
    )["Images"]

    if not images:  # Latest version check
        print("Error: Could not find latest AMI for this system.")
        return None

    latest = sorted(images, key=lambda x: x["CreationDate"], reverse=True)[0]
    return latest["ImageId"]

def create_ec2_instance(args, ec2):     # Create instance
    if not args.system or not args.type:
        print("Error: --system and --type are required for EC2 creation.")
        return

    inst_type = args.type.lower()
    if inst_type not in ["t2.small", "t3.micro"]:
        print("Error: Invalid instance type. Choose 't2.small' or 't3.micro'.")
        return

    ami_id = get_ami_id(ec2, args.system)
    if not ami_id:
        return

    running_instances = ec2.describe_instances(
        Filters=[
            {"Name": "instance-state-name", "Values": ["running"]},
            {"Name": "tag:Owner", "Values": ["itai"]},
            {"Name": "tag:CreatedBy", "Values": ["platform-cli"]}
        ]
    )

    count = sum(len(res["Instances"]) for res in running_instances["Reservations"])
    if count >= 2:
        print("Hard cap reached. You can have up to 2 instances running. Your action is aborted.")
        return

    response = ec2.run_instances(
        ImageId=ami_id,
        InstanceType=inst_type,
        MinCount=1,
        MaxCount=1,
        TagSpecifications=[{
            "ResourceType": "instance",
            "Tags": [
                {"Key": "CreatedBy", "Value": "platform-cli"},
                {"Key": "Owner", "Value": "itai"},
                {"Key": "Name", "Value": args.name if args.name else ""}
            ]
        }]
    )

    print("✅ Instance created:", response["Instances"][0]["InstanceId"])
    print(f"You now have {count+1} instances running. (max 2 allowed)")

def start_or_stop_ec2(args, ec2):    # Start/Stop instance
    desired_state = "stopped" if args.action == "start" else "running"
    filters = [
        {"Name": "tag:CreatedBy", "Values": ["platform-cli"]},
        {"Name": "tag:Owner", "Values": ["itai"]},
        {"Name": "instance-state-name", "Values": [desired_state]}
    ]
    if args.name:
        filters.append({"Name": "tag:Name", "Values": [args.name]})

    instances = ec2.describe_instances(Filters=filters)
    instance_ids = [
        i["InstanceId"]
        for r in instances["Reservations"]
        for i in r["Instances"]
    ]

    if not instance_ids:
        print(f"No instances found to {args.action}.")
        return

    state = instances["Reservations"][0]["Instances"][0]["State"]["Name"]   # Getting the instance's state

    if args.action == "start":
        if state == "running":
            print("This instance is already running.")
        else:
            ec2.start_instances(InstanceIds=instance_ids)
            print("✅ Starting instances:", instance_ids)
    else:
        if state == "stopped":
            print("This instance has already been stopped.")
        else:
            ec2.stop_instances(InstanceIds=instance_ids)
            print("🛑 Stopping instances:", instance_ids)

def list_ec2 (args, ec2):
    instances = ec2.describe_instances(
    Filters=[
        {'Name': 'tag:CreatedBy', 'Values': ['platform-cli']} , {'Name': 'tag:Owner', 'Values': ['itai']}
    ])

    for reservation in instances['Reservations']:
        for instance in reservation['Instances']:
            instance_id = instance['InstanceId']
            state = instance['State']['Name']
            owner = ""
            for tag in instance['Tags']:
                if tag['Key'] == 'Owner':
                    owner = tag['Value']
                    break

            print(f"Instance ID: {instance['InstanceId']}, State: {instance['State']['Name']}, Owner = {owner}")


def delete_ec2_instance(args, ec2):
    if not args.name:
        print("Error: --name is required for deleting an EC2 instance.")
        return

    filters = [
        {"Name": "tag:CreatedBy", "Values": ["platform-cli"]},
        {"Name": "tag:Owner", "Values": ["itai"]},
        {"Name": "tag:Name", "Values": [args.name]}
    ]

    instances = ec2.describe_instances(Filters=filters)
    instance_ids = [
        i["InstanceId"]
        for r in instances["Reservations"]
        for i in r["Instances"]
    ]

    if not instance_ids:
        print("No matching EC2 instances found to delete.")
        return

    try:
        ec2.terminate_instances(InstanceIds=instance_ids)
        print("🗑️ Terminating instances:", instance_ids)
    except Exception as e:
        print(f"Error terminating instances: {e}")




def create_bucket(args , s3 , region):       # Create s3 bucket
    bucket_name = args.name
    status_s3 = args.public  

    if not bucket_name:
        print("Bucket name is required.")
        return

    if status_s3:
        print("Are you sure? (yes/no)")
        answer = input()
        if answer.lower() == "no":
            print("Action is aborted.")
            return
        elif answer.lower() != "yes":
            print("Invalid answer. Please try again")
            return

    try:
        session = boto3.session.Session()
        region = session.region_name or 'us-east-1'

        if region == "us-east-1":
            s3.create_bucket(Bucket=bucket_name)
        else:
            s3.create_bucket(
                Bucket=bucket_name,
                CreateBucketConfiguration={"LocationConstraint": region}
        )
        print(f"Bucket '{bucket_name}' successfully created.")
        
        s3.put_bucket_tagging(
            Bucket=bucket_name,
            Tagging={
                "TagSet": [
                    {"Key": "CreatedBy", "Value": "platform-cli"},
                    {"Key": "Owner", "Value": "itai"}
                ]
            }
            )

        if not status_s3:
            s3.put_public_access_block(
                Bucket=bucket_name,
                PublicAccessBlockConfiguration={
                    "BlockPublicAcls": True,
                    "IgnorePublicAcls": True,
                    "BlockPublicPolicy": True,
                    "RestrictPublicBuckets": True,
                }
            )
            print("Bucket is private. Public access blocked.")

    except Exception as e:
        print(f"Error: {e}")
            

def upload_file_to_bucket(args, s3):
    bucket_name = args.name
    file_path = args.file

    if not bucket_name or not file_path:
        print("Error: --name and --file are required for upload.")
        return

    try:
        s3.head_bucket(Bucket=bucket_name)
    except Exception as e:
        print(f"Error: Bucket '{bucket_name}' does not exist or is inaccessible.")
        return

    try:
        tags = s3.get_bucket_tagging(Bucket=bucket_name)["TagSet"]
        tag_dict = {tag["Key"]: tag["Value"] for tag in tags}

        if tag_dict.get("CreatedBy") != "platform-cli" or tag_dict.get("Owner") != "itai":
            print("Upload denied. This bucket was not created by the CLI.")
            return

    except s3.exceptions.ClientError as e:
        print(" Could not retrieve tags or bucket is not CLI-owned.")
        return

    try:
        file_name = file_path.split("/")[-1]
        s3.upload_file(file_path, bucket_name, file_name)
        print(f" File '{file_name}' uploaded to bucket '{bucket_name}'.")
    except Exception as e:
        print(f"Error uploading file: {e}")


def list_buckets(args, s3):
    try:
        response = s3.list_buckets()
        buckets = response.get("Buckets", [])

        cli_buckets = []

        for bucket in buckets:
            name = bucket["Name"]
            try:
                tags = s3.get_bucket_tagging(Bucket=name)["TagSet"]
                tag_dict = {tag["Key"]: tag["Value"] for tag in tags}
                if tag_dict.get("CreatedBy") == "platform-cli" and tag_dict.get("Owner") == "itai":
                    cli_buckets.append(name)
            except s3.exceptions.ClientError:
                continue  

        if not cli_buckets:
            print("No CLI-created buckets found.")
        else:
            print("CLI-created buckets:")
            for b in cli_buckets:
                print(f" - {b}")

    except Exception as e:
        print(f"Error listing buckets: {e}")


def create_route53_zone(args, route53):
    domain_name = args.name

    if not domain_name:
        print("Error: --name (domain name) is required to create a DNS zone.")
        return

    try:
        response = route53.create_hosted_zone(
            Name=domain_name,
            CallerReference=str(hash(domain_name)),
            HostedZoneConfig={
                "Comment": "Created by platform-cli",
                "PrivateZone": False
            }
        )

        zone_id = response["HostedZone"]["Id"].split("/")[-1]
        print(f" Hosted zone '{domain_name}' created. Zone ID: {zone_id}")
        route53.change_tags_for_resource(
            ResourceType="hostedzone",
            ResourceId=zone_id,
            AddTags=[
                {"Key": "CreatedBy", "Value": "platform-cli"},
                {"Key": "Owner", "Value": "itai"}
        ]
        )

    except Exception as e:
        print(f"Error creating hosted zone: {e}")

def manage_route53_record(args, route53):
    domain_name = args.name
    record_type = args.type or "A"
    action = args.action.lower()
    value = args.system

    if action == "update":
        action = "upsert"  

    if not domain_name.endswith('.'):
        domain_name += '.'

    if not domain_name or (action in ["create", "upsert"] and not value) or action not in ["create", "upsert", "delete"]:
        print("Error: --name (domain), --system (value), and valid action are required.")
        return

    zones = route53.list_hosted_zones()["HostedZones"]
    matching_zones = [z for z in zones if z["Name"].rstrip('.') == domain_name.rstrip('.')]

    if not matching_zones:
        print("Error: Hosted zone not found.")
        return

    zone = matching_zones[0]
    zone_id = zone["Id"]
    tags = route53.list_tags_for_resource(
        ResourceType="hostedzone",
        ResourceId=zone_id.split("/")[-1]
    )["ResourceTagSet"]["Tags"]

    created_by_cli = any(tag["Key"] == "CreatedBy" and tag["Value"] == "platform-cli" for tag in tags)

    if not created_by_cli:
        print("This hosted zone was not created by platform-cli. Action aborted.")
        return

    try:
        response = route53.change_resource_record_sets(
            HostedZoneId=zone_id,
            ChangeBatch={
                "Comment": "Managed by platform-cli",
                "Changes": [
                    {
                        "Action": action.upper(),
                        "ResourceRecordSet": {
                            "Name": domain_name,
                            "Type": record_type,
                            "TTL": 300,
                            "ResourceRecords": [{"Value": value}]
                        }
                    }
                ]
            }
        )
        print(f"Record updated successfully.")

    except Exception as e:
        print(f"Error managing record: {e}")


def list_route53_zones(args, route53):
    try:
        response = route53.list_hosted_zones()
        zones = response.get("HostedZones", [])

        cli_zones = []
        for z in zones:
            zone_id = z["Id"].split("/")[-1]
            tags = route53.list_tags_for_resource(
                ResourceType="hostedzone",
                ResourceId=zone_id
            )["ResourceTagSet"]["Tags"]
            tag_dict = {t["Key"]: t["Value"] for t in tags}
            if tag_dict.get("CreatedBy") == "platform-cli" and tag_dict.get("Owner") == "itai":
                cli_zones.append((z["Name"], z["Id"]))

        if not cli_zones:
            print("No CLI‑created zones found.")
        else:
            print("CLI‑created zones:")
            for name, zid in cli_zones:
                print(f" - {name} (ID: {zid})")

    except Exception as e:
        print(f"Error listing zones: {e}")

def list_route53_records(args, route53):
    domain_name = args.name
    if not domain_name:
        print("Error: --name (domain) is required to list records.")
        return

    response = route53.list_hosted_zones()
    zones = response.get("HostedZones", [])
    matching = [z for z in zones if z["Name"].rstrip('.') == domain_name.rstrip('.')]
    if not matching:
        print("Error: Hosted zone not found.")
        return

    zone = matching[0]
    zone_id = zone["Id"].split("/")[-1]
    tags = route53.list_tags_for_resource(
        ResourceType="hostedzone",
        ResourceId=zone_id
    )["ResourceTagSet"]["Tags"]
    tag_dict = {t["Key"]: t["Value"] for t in tags}
    if tag_dict.get("CreatedBy") != "platform-cli":
        print("This hosted zone was not created by CLI. Cannot list records.")
        return

    try:
        response = route53.list_resource_record_sets(HostedZoneId=zone["Id"])
        recs = response.get("ResourceRecordSets", [])
        if not recs:
            print("No records in this zone.")
        else:
            print(f"Records in zone {domain_name}:")
            for rec in recs:
                values = ", ".join(r["Value"] for r in rec.get("ResourceRecords", []))
                print(f" - {rec['Type']} {rec['Name']} → {values}")

    except Exception as e:
        print(f"Error listing records: {e}")



def main():     # Main menu

    args = parse_args()

    print(f"Resource: {args.resource}")
    print(f"Action: {args.action}")
    if args.name:
        print(f"Name: {args.name}")
    if args.type:
        print(f"Type: {args.type}")
    if args.system:
        print(f"System: {args.system}")
    if args.public:
        print(f"Public: True")

    ec2 = get_ec2_clients()
    s3,region = get_s3_clients()
    route53 = get_route53_client()


    if args.resource == "ec2":
        if args.action == "create":
            create_ec2_instance(args, ec2)
        elif args.action in ["start", "stop"]:
            start_or_stop_ec2(args, ec2)
        elif args.action == "list":
            list_ec2(args, ec2)
        elif args.action == "delete":
            delete_ec2_instance(args, ec2)

    if args.resource == "s3":
        if args.action == "create":
            create_bucket (args , s3 , region)
        elif args.action == "upload":
            upload_file_to_bucket(args, s3)
        elif args.action == "list":
            list_buckets(args, s3)

    if args.resource == "route53":
        if args.action == "create":
            create_route53_zone(args, route53)
        elif args.action in ["update", "delete"]:
            manage_route53_record(args, route53)
        elif args.action == "list" and not args.system:
            list_route53_zones(args, route53)
        elif args.action == "list" and args.system:
            list_route53_records(args, route53)

if __name__ == "__main__":
    main()

