# don't forget the period in parameter names

function migrate() {
  for var in "$@"
  do
    echo "$var"
    mv ~/$var . 
    ln -sv ~/dotfiles/$var ~
  done
}
