#!/bin/bash

today=`date +%F`

#for account in $(aws --output=text organizations list-accounts | grep ACTIVE | awk -F'\t' '{printf("%s\n",$4)}')
#do

#export $(printf "AWS_ACCESS_KEY_ID=%s AWS_SECRET_ACCESS_KEY=%s AWS_SESSION_TOKEN=%s" \
#                $(aws sts assume-role \
#                --role-arn arn:aws:iam::$account:role/OrganizationAccountAccessRole \
#                --role-session-name test \
#                --query "Credentials.[AccessKeyId,SecretAccessKey,SessionToken]" \
#                --output text))

   user=$(aws iam list-users --output text | awk '{print $NF}')
   for usr in $user
   do
	dt=`aws iam list-access-keys --user-name $usr | grep CreateDate | cut -b 28-37 | tail -n1`

        diff=$(( ($(date '+%s' -d "$today") - $(date '+%s' -d "$dt")) / 86400 ))

   	if [ $diff -ge 90 ]; then
        	echo "User $usr has been created Access key on $dt and $diff days ago"
   	fi

 #       unset AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN
   done

#done
