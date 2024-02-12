function aws_help() {
  if [[ $2 == "" ]]; then
    open "https://awscli.amazonaws.com/v2/documentation/api/latest/reference/$1/index.html"
  else
    open "https://awscli.amazonaws.com/v2/documentation/api/latest/reference/$1/$2.html"
  fi
}

function aws_print_creds() {
  for var in "AWS_VAULT" "AWS_ACCESS_KEY_ID" "AWS_SESSION_TOKEN"; do
    echo "$var: ${(P)var}"
  done
}

function aws_print_all() {
  for var in AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN AWS_PROFILE AWS_VAULT AWS_DEFAULT_REGION AWS_REGION AWS_SECURITY_TOKEN AWS_SESSION_EXPIRATION
  do
    echo "$var: ${(P)var}"
  done
}

function aws_profile() {
  # Clear existing AWS Session in case there already is one.
  aws_clear_profile

  export AWS_PROFILE=$1

  aws_info > /dev/null
}

function aws_profile_session() {
  # Clear existing AWS Session in case there already is one.
  aws_clear_profile

  # Exec the given profile and include the new AWS Creds into the current shell session
  source <(aws-vault exec --prompt=osascript $1 -- sh -c 'export -p')

  export AWS_PROFILE=$1
}

function aws_clear_profile() {
  for var in AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN AWS_PROFILE AWS_VAULT AWS_DEFAULT_REGION AWS_REGION AWS_SECURITY_TOKEN AWS_SESSION_EXPIRATION
  do
    unset ${var}
  done
}

## TODO: Likely no longer needed due to docker-credential-ecr-login
## Removed if not used
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
