#!/bin/sh

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set repeat.initial_wait 10
/bin/echo -n .
$cli set parameter.doublepressmodifier_threshold 100
/bin/echo -n .
$cli set repeat.consumer_initial_wait 100
/bin/echo -n .
$cli set remap.jis_command2eisuukana_prefer_command 1
/bin/echo -n .
$cli set option.emacsmode_controlM 1
/bin/echo -n .
$cli set option.emacsmode_controlH 1
/bin/echo -n .
$cli set repeat.wait 20
/bin/echo -n .
$cli set repeat.consumer_wait 50
/bin/echo -n .
$cli set option.extra_cursor_optionL_kjhl 1
/bin/echo -n .
$cli set remap.app_excel_emacs_bindings 1
/bin/echo -n .
$cli set repeat.keyoverlaidmodifier_initial_wait 100
/bin/echo -n .
$cli set option.emacsmode_controlPNBF 1
/bin/echo -n .
/bin/echo
