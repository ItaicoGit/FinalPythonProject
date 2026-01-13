cd
ll
ls
sudo yum update -y
sudo yum install python3 -y
sudo yum install python3-pip -y
ls
ll
pip3 install boto3
sudo yum install awscli -y
aws s3 ls
aws configure
aws s3 ls
ךד
ls
touch app.py
ls
vim app.py 
python app.py ec2 create --type t4.micro
python app.py ec2 create --type t2.micro
python app.py ec2 create --type t2.small
python app.py ec2 create --type t3.micro
app.py ec2 create --type t3.micro
app.py ec2 create --type t4.micro
python3 app.py ec2 create --type t4.micro
python3 app.py ec2 create --type t3.micro
python3 app.py s3 create --name my-bucket --public
python3 app.py s3 create --type t2.small --name my-bucket --public
python3 app.py s3 create --type t2.small --name --ouscut t4 my-bucket --public
python3 app.py s3 create --type t2.small --ouscoot small --name my-bucket --public
python3 app.py s3 create --type t2.small --name my-bucket --public
python3 app.py s3 create --type t2.small --name my-bucket --private
vim app.py 
python3 app.py s3 create --type t2.small --name my-bucket
vim app.py 
python3 app.py s3 create --type t4.small --name test
vim app.py 
python3 app.py ROUTE5353 create --type t4.small --name test2 --public
python3 app.py route53 create --type t4.small --name test2 --public
vim app.py 
python3 app.py ec2 create --name test1 --type t3.micro
vim app.py 
vim ~/.vimrc
vim app.py 
vim ~/.vimrc
vim app.py 
python3 app.py ec2 create --name test1 --type t3.micro
vim app.py 
python3 app.py ec2 create --name test1 --type t4.micro
python3 app.py ec2 create --name test1 --type t3.micro
vim app.py 
python3 app.py ec2 create --type t3.micro
vim app.py 
python3 app.py ec2 create --name test1 --type t4.micro
vim app.py 
python3 app.py ec2 create --name test1itai --type t3.micro
vim app.py 
python3 app.py ec2 create --name test1itai --type t3.micro
ls
python3 app.py ec2 list
vim app.py 
ip
ipconfig
exit
python3 app.py ec2 delete --name test1itai
vim app.py 
python3 app.py ec2 create --name testest --type t2.small --public
vim app.py 
exit
vim app.py 
python3 app.py ec2 create --name momtest --type t2.small --public
exit
history
aws s3 ls
aws ec2 ls
aws help
aws ec2 describe-instances --region us-east-1
history
aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId,State.Name]' --output table --region us-east-1
aws ec2 describe-instances     --query 'Reservations[*].Instances[*].[InstanceId,State.Name,Tags[?Key==`Name`].Value | [0]]'     --output table     --region us-east-1
aws ec2 describe-instances     --query 'Reservations[*].Instances[*].[InstanceId,State.Name,Tags[?Key==`Name`].Value | [0]]'     --output table     --region us-east-1 --filters "Name=instance-state-name,Values=running"
aws ec2 describe-snapshots     --owner-ids self     --query 'Snapshots[*].[SnapshotId,VolumeId,Description,StartTime]'     --output table     --region us-east-1
--------------------------+
|  snap-094216db87bdcb695|  vol-0420f9dee61c88a05 |  Created by CreateImage(i-0dd3316c8cfb84248) for ami-0c16bc0b142eeaed5  |  2025-08-07T08:39:56.486000+00:00  |
|  snap-0584e808860260a00|  vol-023c9452c685997c0 |  itai cli backup-thursday                                               |  2025-08-21T17:55:20.318000+00:00  |
|  snap-0ef348b549f5c3381|  vol-0a1f8853bd25187b4 |                                                                         |  2025-08-20T18:21:59.854000+00:00  |clr
exit
vim app.py 
exit
ls
app.py
vim app.py 
python3 app.py ec2 create --name test --type t2.small --public
vim app.py 
python3 app.py ec2 create --name test --type t3.small --public
python3 app.py ec2 create --name test --type t2.small --public
vim app.py 
aws ec2 describe-snapshots     --owner-ids self     --query 'Snapshots[*].[SnapshotId,VolumeId,Description,StartTime]'     --output table     --region us-east-1
vim app.py 
python3 app.py ec3 create --name test --type t2.small --public
vim app.py 
python3 app.py ec3 create --name test --type t2.small --public
python3 app.py ec2 create --name test --type t2.small --public
vim app.py 
python3 app.py ec2 create --name test --type t2.small --public
vim app.py 
ec2 --help
aws --help
aws describe --help
:q
q
aws ec2 describe 
aws ec2 describe-instaces
aws ec2 describe-instaces (Filters=[{'Name': 'instance-state-name' , 'Values': ['running']}])
aws ec2 describe-instaces Filters=[{'Name': 'instance-state-name' , 'Values': ['running']}]
aws ec2 describe-instances Filters=[{'Name': 'instance-state-name' , 'Values': ['running']}]
aws ec2 describe-instances (Filters=[{'Name': 'instance-state-name' , 'Values': ['running']}])
aws ec2 describe-instances Filters=[{'Name': 'instance-state-name' , 'Values': ['running']}]
aws ec2 describe-n
n
aws ec2 describe-in
aws ec2 describe-instances --filters "Name=instance-state-name,Values=running"
aws ec2 describe-instances --filters "Name=instance-state-name,Values=running"   --query "Reservations[*].Instances[*].InstanceId" --output text
vim app.py 
python3 app.py ec2 create --name test --type t2.small --public
vim app.py 
python3 app.py ec2 create --name test --type t2.small --public
vim app.py 
python3 app.py ec2 create --name test --type t2.small --public
vim app.py 
python3 app.py ec2 create --name test --type t2.small --public
vim app.py 
python3 app.py ec2 create --name test --type t2.small --public
vim app.py 
python3 app.py ec2 create --name test --type t2.small --public --system ubuntu
vim app.py 
python3 app.py ec2 create --name test --type t2.small --public --system ubuntu
vim app.py 
python3 app.py ec2 create --name test --type t2.small --public --system ubuntu
vim app.py 
python3 app.py ec2 create --name test --type t2.small --public --system ubuntu
vim app.py 
python3 app.py ec2 create --name test --type t2.small --public --system ubuntu
vim app.py 
python3 app.py ec2 create --name test --type t2.small --public --system ubuntu
vim app.py 
python3 app.py ec2 create --name test --type t2.small --public --system ubuntu
vim app.py 
python3 app.py ec2 create --name test --type t3.micro --system amazon linux
vim app.py 
python3 app.py ec2 create --name test --type t3.micro --system amazonLinux
vim app.py 
python3 app.py ec2 create --name test --type t3.micro --system ubuntu
vim app.py 
python3 app.py ec2 create --name test --type t3.micro --system amazonLinux
vim app.py 
python3 app.py ec2 create --name test --type t3.micro --system ubuntu
vim app.py 
python3 app.py ec2 create --name test --type t3.micro --system ubuntu
vim app.py 
python3 app.py ec2 create --name test --type t3.micro --system ubuntu
python3 app.py ec2 create --name test --type t3.micro --system amazonLinux
ls
aws ec2 describe-instances Filters=[{'Name': 'instance-state-name' , 'Values': ['running']}]
python3 app.py ec2 create --name test --type t2.small --public --system ubuntu
python3 app.py ec2 create --name test --type t2.small --public --system amazonLinux
vim app.py 
clear
python3 app.py ec2 create --name test --type t2.small --public --system amazonLinux
vim app.py 
python3 app.py ec2 create --name test --type t2.small --public --system amazONLinux
vim app.py 
python3 app.py ec2 create --name test --type t2.small --public --system amazONLinux
vim app.py 
python3 app.py ec2 create --name test --type t2.small --public --system amazONLinux
python3 app.py ec2 create --name test --type t2.small --public --system Unfsjd
vim app.py 
python3 app.py ec2 create --name test --type t2.small --public --system Unfsjdis
python3 app.py ec2 create --name test --type t2.small --public --system UBunTu
vim app.py 
python3 app.py ec2 create --name test --type t2.small --public --system UBunTu
vim app.py 
python3 app.py ec2 create --name test --type t2.small --public --system UBunTud
python3 app.py ec2 create --name test --type t2.small --public --system UBunTu
vim app.py 
python3 app.py ec2 create --name test --type t2.small --public --system UBs
vim app.py 
python3 app.py ec2 create --name test --type t2.small --public --system UBssd
vim app.py 
python3 app.py ec2 create --name test --type t2.small --public --system UBssd
vim app.py 
python3 app.py ec2 create --name test --type t2.small --public --system UBssd
vim app.py 
python3 app.py ec2 create --name test --type t2.small --public --system UBssd
python3 app.py ec2 create --name test --type t2.small --public --system amazonlinuxx
python3 app.py ec2 create --name test --type t2.small --public --system amazonlinux
python3 app.py ec2 create --name test --type t2.small --public --system UBUNT U
python3 app.py ec2 create --name test --type t2.small --public --system AMAZON LINUX
python3 app.py ec2 create --name test --type t2.small --public --system AMAZONLINUX
python3 app.py ec2 create --name test --type t2.small --public --system ubuntu
exit
aws ec2 describe-volumes --filters Name=attachment.instance-id,Values=i-05228ea5b63b267fd
aws ec2 create-snapshot --volume-id vol-"vol-023c9452c685997c0" --description "itai cli backup-friday"
aws ec2 create-snapshot --volume-id vol-"vol-023c9452c685997c0 (itai volume)" --description "itai cli backup-friday"
aws ec2 create-snapshot --volume-id "vol-023c9452c685997c0 (itai volume)" --description "itai cli backup-friday"
aws ec2 create-snapshot --volume-id "vol-023c9452c685997c0" --description "itai cli backup-friday"
exit
ls
vim app.py 
clear
python3 app.py ec2 create --name test --type t3.small --public --system AMAZONLINUX
vim app.py 
python3 app.py ec2 create --name test --type t3.small --public --system AMAZONLINUX
vim app.py 
python3 app.py ec2 create --name test --type t3.small --public --system AMAZONLINUX
vim app.py 
python3 app.py ec2 create --name test --type t3.small --public --system AMAZONLINUX
vim app.py 
python3 app.py ec2 create --name Test --type t3.small --public --system AMAZONLINUX
vim app.py 
python3 app.py ec2 create --name Test --type t3.small --public --system AMAZONLINUX
vim app.py 
python3 app.py ec2 creater --name Test --type t3.small --public --system AMAZONLINUX
vim app.py 
python3 app.py ec2 create --name Test --type t3.smallll --public --system AMAZONLINUXxx
python3 app.py ec2 create --name Test --type t3.small --public --system AMAZONLINUXxx
python3 app.py ec2 create --name Test --type t2.small --public --system AMAZONLINUXxx
python3 app.py ec2 createe --name Test --type t2.small --public --system AMAZONLINUx
vim app.py 
python3 app.py ec2 createe --name Test --type t2.small --public --system AMAZONLINUx
python3 app.py ec5 create --name Test --type t2.small --public --system AMAZONLINUx
vim app.py 
python3 app.py ec2 createe --name Test --type t2.small --public --system AMAZONLINUx
python3 app.py ec2 create --name Test --type t6.small --public --system AMAZONLINUx
vim app.py 
python3 app.py ec2 create --name Test --type t2.small --public --system AMAZONLINUxx
python3 app.py ec2 creater --name Test --type t2.small --public --system AMAZONLINUx
python3 app.py
python3 app.py --help
python3 app.py ec2 create --name Test --type t2.small --public --system AMAZONLINUx
vim app.py 
clear
python3 app.py ec2 create --name Test --type t2.small --public --system AMAZONLINUxx
python3 app.py ec2 create --name Test --type t2.smalll --public --system AMAZONLINUx
python3 app.py ec2 createe --name Test --type t2.small --public --system AMAZONLINUx
python3 app.py ec3 create --name Test --type t2.small --public --system AMAZONLINUx
python3 app.py ec2 create --name Test --type t2.smalll --public --system AMAZONaLINUx
python3 app.py ec2 create --name Test --type t2.small --public --system AMAZONLINUx
vim app.py 
clear
python3 app.py ec3 create --name Test --type t2.small --public --system AMAZONLINUx
python3 app.py ec2 ccreate --name Test --type t2.small --public --system AMAZONLINUx
python3 app.py ec2 create --name Test --type tt2.small --public --system AMAZONLINUx
python3 app.py ec2 create --name Test --type t2.small --public --system aAMAZONLINUx
python3 app.py ec2 create --name Test --type t2.small --public --system AMAZONLINUx
vim app.py 
python3 app.py ec2 create --name Test --type t2.small --public 
python3 app.py ec2 create --name Test --public --system AMAZONLINUx
vim app.py 
python3 app.py ec2 Create --name Test --public --system AMAZONLINUx
vim app.py 
python3 app.py Ec2 Create --name Test --public --system AMAZONLINUx
python3 app.py ec2 Create --name Test --public --system AMAZONLINUx
vim app.py 
python3 app.py ec2 Create --name Test --public --system AMAZONLINUx
python3 app.py ec2 Create --name Test --public --system AMAZONLINUx --type t3.micro
python3 app.py Ec2 create --name Test --public --system AMAZONLINUx --type t3.micro
vim app.py 
clear
python3 app.py Ec2 start --name Test --public --system AMAZONLINUx --type t3.micro
python3 app.py Ec2 Start --name Test --public --system AMAZONLINUx --type t3.micro
python3 app.py Ec2 create --name Test --public --system AMAZONLINUx --type t3.micro
vim app.py 
python3 app.py Ec2 create --name Test2 --public --system AMAZONLINUx --type t3.micro
vim app.py 
python3 app.py Ec2 create --name Test2 --public --system AMAZONLINUx --type t3.micro
python3 app.py Ec2 start --name Test2 --public --system AMAZONLINUx --type t3.micro
python3 app.py Ec2 stop --name Test2 --public --system AMAZONLINUx --type t3.micro
vim app.py 
python3 app.py Ec2 stop --name Test2 --public --system AMAZONLINUx --type t3.micro
vim app.py 
python3 app.py Ec2 stop --name Test2 --public --system AMAZONLINUx --type t3.micro
python3 app.py Ec2 start --name Test2 --public --system AMAZONLINUx --type t3.micro
python3 app.py Ec2 start --name Test1 --public --system AMAZONLINUx --type t3.micro
python3 app.py Ec2 start --name Test --public --system AMAZONLINUx --type t3.micro
vim app.py 
python3 app.py Ec2 start --name Test --public --system AMAZONLINUx --type t3.micro
vim app.py 
python3 app.py Ec2 create --name Test --public --system AMAZONLINUx --type t3.micro
vim app.py 
python3 app.py Ec2 create --name Test --public --system AMAZONLINUx --type t3.micro
vim app.py 
python3 app.py Ec2 create --name Test --public --system AMAZONLINUx --type t3.micro
vim app.py 
python3 app.py Ec2 create --name Test --public --system AMAZONLINUx --type t3.micro
python3 app.py Ec2 stop --name Test2 --public --system AMAZONLINUx --type t3.micro
python3 app.py Ec2 stop --name Test --public --system AMAZONLINUx --type t3.micro
Resource: ec2
Action: stop
Name: Test
Type: t3.micro
Public: True
System: amazonlinux
Traceback (most recent call last):
  File "/home/ec2-user/app.py", line 156, in <module>
    main()   File "/home/ec2-user/app.py", line 135, in main
    filters.append({'Name': 'tag:Name', 'Values': [args.name]})
NameError: name 'filters' is not defined
clear
python3 app.py Ec2 stop --name Test --public --system AMAZONLINUx --type t3.micro
vim app.py 
python3 app.py Ec2 stop --name Test --public --system AMAZONLINUx --type t3.micro
vim app.py 
python3 app.py Ec2 stop --name Test --public --system AMAZONLINUx --type t3.micro
vim app.py 
python3 app.py Ec2 stop --name Test --public --system AMAZONLINUx --type t3.micro
vim app.py 
python3 app.py Ec2 stop --name Test --public --system AMAZONLINUx --type t3.micro
vim app.py 
python3 app.py Ec2 stop --name Test --public --system AMAZONLINUx --type t3.micro
vim app.py 
python3 app.py Ec2 stop --name Test --public --system AMAZONLINUx --type t3.micro
vim app.py 
python3 app.py Ec2 CREATE --name Test --public --system AMAZONLINUx --type t3.micro
python3 app.py Ec2 stop --name Test2 --public --system AMAZONLINUx --type t3.micro
vim app.py 
python3 app.py Ec2 stop --name Test2 --public --system AMAZONLINUx --type t3.micro
python3 app.py Ec2 stop --name Test --public --system AMAZONLINUx --type t3.micro
python3 app.py Ec2 start --name Test2 --public --system AMAZONLINUx --type t3.micro
python3 app.py Ec2 start --name Test --public --system AMAZONLINUx --type t3.micro
python3 app.py Ec2 stop --name Test --public --system AMAZONLINUx --type t3.micro
python3 app.py Ec2 create --name Test2 --public --system AMAZONLINUx --type t3.micro
python3 app.py Ec2 stop --name Test --public --system AMAZONLINUx --type t3.micro
python3 app.py Ec2 stop --name Test2 --public --system AMAZONLINUx --type t3.micro
vim app.py 
python3 app.py Ec2 starT --name Test2 --public --system AMAZONLINUx --type t3.micro
python3 app.py Ec2 CREAte --name Test3 --public --system AMAZONLINUx --type t3.micro
python3 app.py Ec2 cREAte --name Test4 --system AMAZONLINUx --type t3.micro
vim app.py 
clear
python3 app.py Ec2 Stopp --name Test3 --system AMAZONLINUx --type t3.micro
python3 app.py Ec2 Stop --name Test3 --system AMAZONLINUx --type t3.micro
python3 app.py Ec2 Start --name Test4 --system AMAZONLINUx --type t3.micro
python3 app.py Ec2 Stop --name Test3 --system AMAZONLINUx --type t3.micro
vim app.py 
python3 app.py Ec2 Stop --name TEst3 --system AMAZONLINUx --type t3.micro
vim app.py 
python3 app.py Ec2 Stop --name TEst3 --system AMAZONLINUx --type t3.micro
vim app.py 
python3 app.py Ec2 Stop --name TEst3 --system AMAZONLINUx --type t3.micro
python3 app.py Ec2 Stop --name Test3 --system AMAZONLINUx --type t3.micro
vim app.py 
python3 app.py Ec2 Stop --name Test3 --system AMAZONLINUx --type t3.micro
vim app.py 
python3 app.py Ec2 Stop --name Test3 --system AMAZONLINUx --type t3.micro
vim app.py 
python3 app.py Ec2 Stop --name Test3 --system AMAZONLINUx --type t3.micro
python3 app.py Ec2 StaRT --name Test4 --system AMAZONLINUx --type t3.micro
python3 app.py Ec2 StaRT --name Test3 --system AMAZONLINUx --type t3.micro
python3 app.py Ec2 STOp --name Test4 --system AMAZONLINUx --type t3.micro
vim app.py 
vim --version
vim --version | grep clipboard
sudo yum install vim-enhanced
sudo yum install neovim
vim app.py 
aws configure
vim app.py 
python3 app.py Ec2 create --name Test3 --system AMAZONLINUx --type t3.micro
python3 app.py Ec2 stop --name Test3
vim app.py 
python3 app.py Ec2 stop --name Test3
vim app.py 
python3 app.py Ec2 stop --name Test3
vim app.py 
python3 app.py Ec2 stop --name Test3
vim app.py 
python3 app.py Ec2 stop --name Test3
vim app.py 
python3 app.py Ec2 stop --name Test3
vim app.py 
python3 app.py Ec2 stop --name Test3
vim app.py 
python3 app.py Ec2 stop --name Test3
vim app.py 
touch app2.py
cp app.py app2.py
vim app2.py 
clear
vim app.py 
vim app2.py 
python3 app2.py Ec2 stop --name Test3
python3 app2.py Ec2 Stop --Name Test3 --systEm AMAZONLINUx --Type t3.micro --public
python3 app2.py Ec2 Stop --name Test3 --system AMAZONLINUx --type t3.micro --public
python3 app2.py Ec2 create --name Test3 --system AMAZONLINUx --type t3.micro --public
python3 app2.py Ec2 start --public
python3 app2.py Ec2 stop --name Test4
python3 app2.py Ec2 stop --name Test3
python3 app2.py Ec2 start --name Test3
python3 app2.py Ec2 create --name Test --system AMAZONLINUx --type t3.micro --public
python3 app2.py Ec2 create --name Test2 --system AMAZONLINUx --type t3.micro --public
python3 app2.py Ec2 start --name Test3
python3 app2.py Ec2 start --name Test1
python3 app2.py Ec2 start --name Test
python3 app2.py Ec2 start --name Test2
python3 app2.py Ec2 stop --name Test2
python3 app2.py Ec2 start --name Test2
vim app2.py
python3 app2.py Ec2 list
vim app2.py
python3 app2.py Ec2 list
vim app2.py
python3 app2.py Ec2 list
vim app2.py
python3 app2.py Ec2 list
vim app2.py
python3 app2.py Ec2 list
vim app2.py
python3 app2.py Ec2 list
vim app2.py
python3 app2.py Ec2 list
vim app2.py
python3 app2.py Ec2 list
vim app2.py
python3 app2.py Ec2 list
vim app2.py
python3 app2.py Ec2 list
python3 app2.py ec2 list
vim app2.py 
clear
vim app2.py 
python3 app2.py Ec2 list
exit
python3 app2.py ec2 list
exit
ls
vim app2.py
python3 app2.py s3 create --name my-bucket1 --access public
vim app2.py
python3 app2.py s3 create --name my-bucket1 --access public
vim app2.py
python3 app2.py s3 create --name my-bucket1 --access public
vim app2.py
python3 app2.py s3 create --name my-bucket1 --access public
vim app2.py
python3 app2.py s3 create --name my-bucket1 --access public
vim app2.py
python3 app2.py s3 create --name my-bucket1 --access public
vim app2.py
python3 app2.py s3 create --name my-bucket1 --access public
vim app2.py
python3 app2.py s3 create --name my-bucket1 --access public
vim app2.py
python3 app2.py s3 create --name my-bucket1 --access public
vim app2.py
python3 app2.py s3 create --name my-bucket1 --access public
vim app2.py
clear
python3 app2.py s3 create --name my-bucket1 --access public
python3 app2.py s3 create --name my-bucket1 --public
python main.py s3 create --name my-bucket-name --public public
python3 app2.py s3 create --name my-bucket-name --public public
python3 app2.py s3 create --name my-bucket-name --public 
vim app2.py 
clear
python3 app2.py s3 create --name my-bucket-name --public 
vim app2.py 
python3 app2.py s3 create --name my-bucket-name --public 
vim app2.py 
python3 app2.py s3 create --name my-bucket-name --public 
vim app2.py 
python3 app2.py s3 create --name my-bucket-name --public 
vim app2.py 
python3 app2.py s3 create --name my-bucket-name --public 
vim app2.py 
python3 app2.py s3 create --name my-bucket-name --public 
aws configure list
vim app2.py 
python3 app2.py s3 create --name my-bucket-name --public 
vim app2.py 
clear
python3 app2.py s3 create --name my-bucket-name --public 
vim app2.py 
python3 app2.py s3 create --name my-bucket-name --public 
python3 app2.py s3 create --name my-bucket-name 
