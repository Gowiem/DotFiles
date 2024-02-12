function yubi() {
  if [[ "$1" != "" ]]; then
    YK_PROFILE=$1
  else
    YK_PROFILE=oc # Default
  fi

  YK_KEY=$(ykpixel oath accounts code $YK_PROFILE)

  YK_CODE=$(echo $YK_KEY | awk -F "$YK_PROFILE  " '{print $2}')

  echo $YK_CODE | pbcopy

  echo "Yubikey Code is: $YK_CODE"

  YK_KEY=""
  YK_CODE=""
}

function ykregister() {
  name=$1
  secret=$2

  ykpixel oath accounts add -t $name $secret
  ykcamo oath accounts add -t $name $secret
  ykgeode oath accounts add -t $name $secret
}

alias ykpixel="ykman --device 15267165"
alias ykcamo="ykman --device 18385285"
alias ykgeode="ykman --device 18385407"
