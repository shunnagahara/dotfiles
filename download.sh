#!/bin/bash
DOTPATH=~/dotfiles

# functions
has() {
  type "$1" > /dev/null 2>&1
}

# curl を使用する
if has "curl"; then

    curl -L https://github.com/shunnagahara/dotfiles/archive/master.tar.gz

    # 解凍する
    tar zxf master.tar.gz -C ~

    # 解凍したら，DOTPATH に置く
    mv -f ~/dotfiles-master "$DOTPATH"

else
    die "curl required"
fi

cd ~/dotfiles

if [ $? -ne 0 ]; then
    die "Not found: $DOTPATH"
else
    echo "You're at dotfiles directory"
fi
