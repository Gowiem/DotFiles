atmos_plan() {
  atmos terraform plan $1 --stack $2
}

atmos_apply() {
  atmos terraform apply $1 --stack $2 --from-plan
}
