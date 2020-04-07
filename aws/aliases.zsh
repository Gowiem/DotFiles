alias aws_creds="atom ~/.aws/credentials"

# AWS Vault
alias av='aws-vault'

alias avnk='aws-vault exec nk-terraform --'
alias avgow='aws-vault exec gowiem --'
alias avsubgow='aws-vault exec sub-gowiem --'

alias gow_sesh='avgow aws ssm start-session --target'
alias nk_sesh='avnk aws ssm start-session --target'
