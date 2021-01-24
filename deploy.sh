#!/bin/bash

set -u

# 実行場所のディレクトリを取得
THIS_DIR=$(cd $(dirname $0); pwd)

cd $THIS_DIR

echo "###############################################"
echo "DOTFILES DEPLOY START!"
echo "###############################################"

for f in .??*; do
    [ "$f" = ".git" ] && continue
    [ "$f" = ".gitconfig.local.template" ] && continue
    [ "$f" = ".require_oh-my-zsh" ] && continue
    [ "$f" = ".gitmodules" ] && continue
    [ "$f" = ".config" ] && continue

    ln -snfv ~/dotfiles/"$f" ~/
done

echo "###############################################"
echo "VSCODE SETTING START!"
echo "###############################################"

sh ./vscode.install.sh

echo "###############################################"
echo "VSCODE SETTING END!"
echo "###############################################"

cat << END

**************************************************
DOTFILES DEPLOY FINISHED! bye.
**************************************************

END
