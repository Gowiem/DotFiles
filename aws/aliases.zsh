# General AWS
alias aws_creds="edit ~/.aws/credentials"
alias aws_config="edit ~/.aws/config"
alias aws_info="aws sts get-caller-identity"

# AWS Vault
alias av='aws-vault'
alias ave='aws-vault exec'

# AWS Vault - Login / Logout
alias avl='avlogout && sleep 1 && avlogin'
alias avlogin='av login'
alias avlogout='open https://console.aws.amazon.com/console/logout!doLogout'

# AWS Profile
alias ap='aws_profile'
alias aps='aws_profile_session'
alias apclear='aws_clear_profile'
alias apc='aws_clear_profile'
