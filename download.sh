#!/bin/bash
DOTPATH=~/dotfiles

# functions
has() {
  type "$1" > /dev/null 2>&1
}

# git が使えるなら git
if has "git"; then
    git clone --recursive "https://github.com/shunnagahara/dotfiles.git"

# 使えない場合は curl か wget を使用する
elif has "curl" || has "wget"; then
    tarball="https://github.com/shunnagahara/dotfiles/archive/master.tar.gz"

    # どっちかでダウンロードして，tar に流す
    if has "curl"; then
        curl -L "$tarball"

    elif has "wget"; then
        wget -O - "$tarball"

    fi | tar zxv

    # 解凍したら，DOTPATH に置く
    mv -f dotfiles-master "$DOTPATH"

else
    die "curl or wget required"
fi

cd ~/dotfiles
if [ $? -ne 0 ]; then
    die "Not found: $DOTPATH"
else
    echo "You're at dotfiles directory"
fi