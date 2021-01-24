THIS_DIR=$(cd $(dirname $0); pwd)
VSCODE_SETTING_DIR=~/Library/Application\ Support/Code/User

mv "$VSCODE_SETTING_DIR/settings.json" "$VSCODE_SETTING_DIR/settings.json.init.bkup"
rm "$VSCODE_SETTING_DIR/settings.json"
ln -s "$THIS_DIR/vscode/settings.json" "${VSCODE_SETTING_DIR}/settings.json"

mv "$VSCODE_SETTING_DIR/keybindings.json" "$VSCODE_SETTING_DIR/keybindings.json.init.bkup"
rm "$VSCODE_SETTING_DIR/keybindings.json"
ln -s "$THIS_DIR/vscode/keybindings.json" "${VSCODE_SETTING_DIR}/keybindings.json"

# install extention
cat vscode/extensions | while read line
do
 code --install-extension $line
done

code --list-extensions > extensions