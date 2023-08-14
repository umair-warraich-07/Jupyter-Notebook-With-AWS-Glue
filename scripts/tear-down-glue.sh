#!/bin/sh -e

export "REGION=$(yq e '.region' config/properties.yml)"
export "STACK_NAME=$(yq e '.stack_name' config/properties.yml)"
export "BUCKET_NAME=$(yq e '.bucket_name' config/properties.yml)"

echo "aws cloudformation delete-stack --stack-name $STACK_NAME --region $REGION"
aws cloudformation delete-stack --stack-name $STACK_NAME --region $REGION
aws s3 rm "s3://$BUCKET_NAME" --recursive
aws s3api delete-bucket --bucket $BUCKET_NAME