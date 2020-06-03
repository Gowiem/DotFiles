function tfplan() {
  if [[ -d "./.terraform/" ]]; then

    workspace_name=$(terraform workspace show)
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

function tf_make_module() {
  local module_name=$1

  if [[ ! -d "./.terraform/" ]]; then
    echo "You're not in a terraform directory!"
    exit 1
  fi

  mkdir -p "./modules/${module_name}"
  echo "# ${module_name}.tf\n" >"./modules/${module_name}/main.tf"
  echo "# ${module_name}.tf\n" >"./modules/${module_name}/variables.tf"
  echo "# ${module_name}.tf\n" >"./modules/${module_name}/outputs.tf"
  echo "Successfully created ${module_name} module!"
}
