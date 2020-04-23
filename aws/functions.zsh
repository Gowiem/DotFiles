function aws_reset_session() {
  for var in AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN VAULT_PROFILE AWS_VAULT AWS_DEFAULT_REGION AWS_REGION AWS_SECURITY_TOKEN AWS_SESSION_EXPIRATION
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
  # Set VAULT_PROFILE which is used in my Right Prompt
  export VAULT_PROFILE=$1

  # Exec the given profile and include the new AWS Creds into the current shell session
  source <(aws-vault exec $VAULT_PROFILE --no-session -- sh -c 'export -p')
}

function aws_ecr_login() {
  eval $(aws ecr get-login --region us-east-1 --no-include-email)
}
