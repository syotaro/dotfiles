#!/bin/sh

# Export Command : /Applications/KeyRemap4MacBook.app/Contents/Applications/KeyRemap4MacBook_cli.app/Contents/MacOS/KeyRemap4MacBook_cli export > ~/.dotfiles/keyremap4mb-importconfig.sh

cli=/Applications/KeyRemap4MacBook.app/Contents/Applications/KeyRemap4MacBook_cli.app/Contents/MacOS/KeyRemap4MacBook_cli

$cli set repeat.initial_wait 100
/bin/echo -n .
$cli set repeat.consumer_initial_wait 100
/bin/echo -n .
$cli set remap.jis_command2eisuukana_prefer_command 1
/bin/echo -n .
$cli set option.emacsmode_controlM 1
/bin/echo -n .
$cli set option.emacsmode_controlH 1
/bin/echo -n .
$cli set repeat.wait 43
/bin/echo -n .
$cli set repeat.consumer_wait 50
/bin/echo -n .
$cli set option.extra_cursor_optionL_kjhl 1
/bin/echo -n .
$cli set remap.app_excel_emacs_bindings 1
/bin/echo -n .
$cli set option.emacsmode_controlPNBF 1
/bin/echo -n .
/bin/echo
