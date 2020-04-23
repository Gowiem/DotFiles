function tfplan() {
  if [[ -d "./.terraform/" ]]; then

    workspace_name=$( terraform workspace show )
    if [[ -f "tfvars/${workspace_name}.tfvars" ]]; then
      echo "Running terraform plan with ${workspace_name}.tfvars..."
      WORKSPACE_ARG="-var-file=tfvars/${workspace_name}.tfvars"
    fi

    if [[ -f "tfvars/secrets.tfvars" ]]; then
      echo "Running terraform plan with secrets.tfvars..."
      SECRETS_ARG="-var-file=tfvars/secrets.tfvars"
    fi

    terraform plan -out=run.plan $WORKSPACE_ARG $SECRETS_ARG $*
  else
    echo "You're not in a terraform directory!"
  fi
}
