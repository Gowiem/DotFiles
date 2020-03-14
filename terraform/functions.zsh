function tfplan() {
  if [[ -d "./.terraform/" ]]; then

    workspace_name=$( terraform workspace show )
    if [[ -f "${workspace_name}.tfvars" ]]; then
      echo "Running terraform plan with ${workspace_name}.tfvars..."
      WORKSPACE_ARG="-var-file=${workspace_name}.tfvars"
    fi

    if [[ -f "secrets.tfvars" ]]; then
      echo "Running terraform plan with secrets.tfvars..."
      SECRETS_ARG="-var-file=secrets.tfvars"
    fi

    terraform plan -out=run.plan $WORKSPACE_ARG $SECRETS_ARG $*
  fi
}
