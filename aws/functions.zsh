function aws_reset_session() {
  for var in AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN
  do
    unset ${var}
  done
}
