alias aws_creds="edit ~/.aws/credentials"
alias aws_config="edit ~/.aws/config"
alias aws_info="aws sts get-caller-identity"

# AWS Vault
alias av='aws-vault'

alias aprof='aws_profile'
alias ap='aws_profile'
alias aps='aws_profile_session'

alias avclear='aws_clear_profile'
alias avc='aws_clear_profile'

alias avl='avlogout && sleep 2 && avlogin'
alias avlogin='av login'
alias avlogout='open https://console.aws.amazon.com/console/logout!doLogout'
