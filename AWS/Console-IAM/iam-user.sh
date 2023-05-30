#!/bin/bash

for account in $(aws --output=text organizations list-accounts | grep ACTIVE | awk -F'\t' '{printf("%s\n",$4)}')
do

        export $(printf "AWS_ACCESS_KEY_ID=%s AWS_SECRET_ACCESS_KEY=%s AWS_SESSION_TOKEN=%s" \
                $(aws sts assume-role \
                --role-arn arn:aws:iam::$account:role/OrganizationAccountAccessRole \
                --role-session-name test \
                --query "Credentials.[AccessKeyId,SecretAccessKey,SessionToken]" \
                --output text))

        aws sts get-caller-identity

	    aws iam list-users |grep -i username |awk -F '"' '{print $4}' >> $account ; cat list_users |awk '{print $NF}'

        unset AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN
        aws sts get-caller-identity
        clear
done


