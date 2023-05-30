#!/bin/bash
#This script will give the list of user have password age more than 90 days

#for account in $(aws --output=text organizations list-accounts | grep ACTIVE | awk -F'\t' '{printf("%s\n",$4)}')
#do
today=`date +%F`

#export $(printf "AWS_ACCESS_KEY_ID=%s AWS_SECRET_ACCESS_KEY=%s AWS_SESSION_TOKEN=%s" \
#                $(aws sts assume-role \
#                --role-arn arn:aws:iam::$account:role/OrganizationAccountAccessRole \
#                --role-session-name rolename \
#                --query "Credentials.[AccessKeyId,SecretAccessKey,SessionToken]" \
#                --output text))

user=$(aws iam list-users --output text | awk '{print $NF}')
for usr in $user
do
        dt=`aws iam get-user --output text  --user-name $usr --query 'User.[PasswordLastUsed]' | cut -f1 -d"T"`
        if [ $dt != None ]; then
                diff=$(( ($(date '+%s' -d "$today") - $(date '+%s' -d "$dt")) / 86400 ))
                if [ $diff -ge 90 ]; then 
                        echo "User $usr has last login date is $dt and $diff days ago"
                fi
        fi
done
#        unset AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN
#        aws sts get-caller-identity
#done
