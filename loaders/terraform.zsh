function tf_with_vars() {
  local cmd=$1
  shift # Removes arg 1 from arg list

  if [[ ! -d "./.terraform/" ]]; then
    echo "You're not in a terraform directory!"
    return
  fi

  local workspace_name=$(terraform workspace show)
  if [[ -f "tfvars/${workspace_name}.tfvars" ]]; then
    echo "Running terraform $cmd with tfvars/${workspace_name}.tfvars..."
    local WORKSPACE_ARG="-var-file=tfvars/${workspace_name}.tfvars"
  fi

  if [[ -f "tfvars/secrets.tfvars" ]]; then
    echo "Running terraform $cmd with secrets.tfvars..."
    local SECRETS_ARG="-var-file=tfvars/secrets.tfvars"
  fi

  if [[ "$cmd" == "plan" ]]; then
    terraform plan -out=run.plan $WORKSPACE_ARG $SECRETS_ARG $*
  else
    terraform $cmd $WORKSPACE_ARG $SECRETS_ARG $*
  fi
}

function tfplan() {
  tf_with_vars plan $*
}

function tfrefresh() {
  tf_with_vars refresh $*
}

function tfimport() {
  tf_with_vars import $*
}

function tfyolo() {
  tf_with_vars apply -auto-approve $*
}

function tf_reinstall_modules() {
  if [[ ! -d "./.terraform/" ]]; then
    echo "You're not in a terraform directory!"
    return
  fi

  rm -rf ./.terraform/modules

  terraform init
}

function tf_make_module() {
  local module_name=$1

  if [[ ! -d "./.terraform/" ]]; then
    echo "You're not in a terraform directory!"
    return
  fi

  mkdir -p "./modules/${module_name}"
  echo "# ${module_name}.tf\n" >"./modules/${module_name}/main.tf"
  echo "# ${module_name}.tf\n" >"./modules/${module_name}/variables.tf"
  echo "# ${module_name}.tf\n" >"./modules/${module_name}/outputs.tf"
  echo "Successfully created ${module_name} module!"
}

function tf_make_project() {
  echo "# main.tf\n" >"./main.tf"
  echo "# variables.tf\n" >"./variables.tf"
  echo "# outputs.tf\n" >"./outputs.tf"
  echo "# provider.tf\n" >"./provider.tf"

  tf_install_commit_hook
}

function tf_install_commit_hook() {

  cat ~/.dotfiles/terraform/terraform-pre-commit-hook.yaml >.pre-commit-config.yaml
  pre-commit install --install-hooks
}
