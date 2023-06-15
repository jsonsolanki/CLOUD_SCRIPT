#!/bin/bash

project=$(gcloud projects list | tail -n +2 |  grep PROJECT_ID | awk {'print $2'})
for projct in {$project}
do 
 echo $projct >> list_users
 gcloud projects get-iam-policy $projct \
 --filter="user" \
 --flatten="bindings[].members" \
 --format="value(bindings.members.split(':').slice(1:).flatten())" \
 --sort-by=bindings.members | uniq >> list_users
done
