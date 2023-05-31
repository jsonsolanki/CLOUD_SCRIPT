# This script will provide the list of users on your AWS Account.

### Prerequisites
- AWS Org. account/single account console or programmatically access with IAM access policy

### For Org. Account
- Clone this repository to your system by using the org. account access & secret key or org. account cloudshell and run this script.

### For Single Account
- Run the following command ``` aws iam list-users |grep -i username |awk -F '"' '{print $4}' ```
