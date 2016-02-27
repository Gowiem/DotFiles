function hasmattgkey() {
  ssh-add -D;
  ssh-add ~/.ssh/id_rsa;
  ssh-add ~/.ssh/tune/id_rsa;
}

function gowiemkey() {
  ssh-add -D;
  ssh-add ~/.ssh/id_rsa;
  ssh-add ~/.ssh/github_rsa;
}

function artisanadminkey() {
  ssh-add ~/.ssh/artisan-admin.pem;
}