#! /bin/bash -eu

api=$(terraform output -json | jq -r '.api_invoke_url.value') 
lambda=$(terraform output -json | jq -r '.lambda_name.value') 

printf "\nHit api:\n"
printf "curl -i %s" "${api}"

printf "\n\nHit api (auth edition - replace xxx with auth token):\n"
printf "curl -i \\ \n"
printf "   --url %s \\ \n" "${api}" 
printf "   --header 'authorization: Bearer xxx' "

printf "\n\nInvoke lambda:\n"
printf "aws lambda invoke --function-name %s --payload '{}' response.json\n\n" "${lambda}" 
