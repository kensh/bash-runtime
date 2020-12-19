#chmod +x bootstrap function.sh
#zip function.zip function.sh bootstrap

export ACCOUNT_ID=$(aws sts get-caller-identity | jq --raw-output .Account)

aws lambda create-function --function-name bash-runtime \
--zip-file fileb://function.zip --handler function.handler --runtime provided \
--role arn:aws:iam::${ACCOUNT_ID}:role/LambdaBasic