# This script will give the list of user have on your AWS Account

### Prerequisites
- AWS Org. account/single account console or programmatically access with IAM access policy

### For Org. Account
- Clone this repository into your laptop using org. account access and secret key or org. account cloudshell and run this script.

### For Single Account
- Run following command ``` aws iam list-users |grep -i username |awk -F '"' '{print $4}' ```
