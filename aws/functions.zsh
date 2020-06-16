function aws_reset_session() {
  for var in AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN VAULT_PROFILE AWS_VAULT AWS_DEFAULT_REGION AWS_REGION AWS_SECURITY_TOKEN AWS_SESSION_EXPIRATION AWS_PROFILE
  do
    unset ${var}
  done
}

function aws_print_creds() {
  for var in "AWS_VAULT" "AWS_ACCESS_KEY_ID" "AWS_SESSION_TOKEN"; do
    echo "$var: ${(P)var}"
  done
}

function avprof() {
  # Reset AWS Session in case there already is one.
  unset VAULT_PROFILE
  unset AWS_PROFILE
  $(aws_reset_session)

  # Exec the given profile and include the new AWS Creds into the current shell session
  source <(aws-vault exec $1 --no-session -- sh -c 'export -p')

  # Set VAULT_PROFILE which is used in my Right Prompt
  export VAULT_PROFILE=$1
  export AWS_PROFILE=$1
}

function aws_ecr_login() {
  local region=$1
  if [[ "$region" != "" ]]; then
    echo "Running ECR Login with supplied region: $region"
    eval $(aws ecr get-login --region $region --no-include-email)
  elif [[ $AWS_DEFAULT_REGION != "" ]]; then
    echo "Running ECR Login with AWS_DEFAULT_REGION: $AWS_DEFAULT_REGION"
    eval $(aws ecr get-login --region $AWS_DEFAULT_REGION --no-include-email)
  else
    echo "Running ECR Login with default region: us-west-2"
    eval $(aws ecr get-login --region us-west-2 --no-include-email)
  fi
}
