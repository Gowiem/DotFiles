function aws_reset_session() {
  for var in AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN AWS_PROFILE AWS_VAULT VAULT_PROFILE AWS_DEFAULT_REGION AWS_REGION AWS_SECURITY_TOKEN AWS_SESSION_EXPIRATION
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
  aws_reset_session

  # Exec the given profile and include the new AWS Creds into the current shell session
  source <(aws-vault exec $1 --no-session -- sh -c 'export -p')

  # Set VAULT_PROFILE which is used in my Right Prompt
  export VAULT_PROFILE=$1
  export AWS_PROFILE=$1
}

function avrefresh() {
  # Store the current profile name
  local TEMP=$VAULT_PROFILE

  # Reset the current session.
  aws_reset_session

  # Sign back into our existing Profile
  avprof $TEMP
}

function aws_ecr_login() {
  local region=""
  local account_id=$(aws_info | jq -r .Account)

  if [[ "$1" != "" ]]; then
    region=$1
  elif [[ $AWS_DEFAULT_REGION != "" ]]; then
    region=$AWS_DEFAULT_REGION
  else
    region="us-west-2"
  fi

  echo "Running ECR Login with region: $region"

  aws ecr get-login-password --region $region \
    | docker login \
             --username AWS \
             --password-stdin $account_id.dkr.ecr.$region.amazonaws.com
}
