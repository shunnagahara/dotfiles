#!/bin/bash
DOTPATH=~/dotfiles

# functions
has() {
  type "$1" > /dev/null 2>&1
}

# git が使えるなら git
if has "git"; then
    git clone --recursive "https://github.com/shunnagahara/dotfiles.git"

# 使えない場合は curl を使用する
elif has "curl"; then

    if has "curl"; then
        curl -0L https://github.com/shunnagahara/dotfiles/archive/master.tar.gz

    fi

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
