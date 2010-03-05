#!/bin/sh
# Blue
# Created by BadlandZ in v.0.4b
# Adapted by jf
# Changed By Spidey 08/06 Adding Ending brackets \]
# Changed by Arnognulf, converted to Bashish prompt, UTF-8 / CP437

_bashish_prompt () {
## load some compat variables, TIME, DATE, BEGIN_HIDE, END_HIDE etc
eval $(_bashish_prompt_shellvars $SHELLNAME)
eval $(_bashish_prompt_parsecolors "$@")
test "x${BASHISH_COLOR0}" = x && eval $(_bashish_prompt_parsecolors blue)

$_typeset FADE="`_bashish_prompt_cp437 DB B2 B1 B0`"
test x${PROMPTSTR} = x && $_typeset PROMPTSTR=${USER}@${HOSTNAME%%.*}
$_typeset GIT_PS1=$(__git_ps1 "%s" 2>/dev/null)
test "x${GIT_PS1}" != x && GIT_PS1="${EMBED}${ESC}[3${BASHISH_COLOR0};2m${UNEMBED}(${EMBED}${ESC}[3${BASHISH_COLOR0};1m${UNEMBED}${GIT_PS1}${EMBED}${ESC}[3${BASHISH_COLOR0};2m${UNEMBED})${EMBED}${ESC}[0m${UNEMBED} "
$_typeset ROOT=""
test "x${UID}" = x0 && ROOT="$EMBED${ESC}[3${BASHISH_COLOR0};1m$UNEMBED#$EMBED${ESC}[0m$UNEMBED "

PS1="\
${ESC}[40m`_bashish_prompt_fillx \" \"`\
${ESC}[0G\
${ESC}[3${BASHISH_COLOR0};4${BASHISH_COLOR0};1m$FADE\
${ESC}[37;4${BASHISH_COLOR0};1m${PROMPTSTR}\
${ESC}[0m\
${ESC}[3${BASHISH_COLOR0};40m$FADE\
${ESC}[37;40;1m ${DATE} ${TIME}\
${ESC}[9${BASHISH_COLOR0}m\
${ESC}[6D:\
${ESC}[2C:\
${ESC}[2C${ESC}[0m
${EMBED}${ESC}[3${BASHISH_COLOR0};1m${UNEMBED}"`_bashish_prompt_cwd "${EMBED}\033[0;3${BASHISH_COLOR0}m${UNEMBED}" "${EMBED}\033[3${BASHISH_COLOR0};1m${UNEMBED}" \`expr $COLUMNS / 2\``"/${EMBED}\
${ESC}[0m${UNEMBED} ${GIT_PS1}${ROOT}"

PS2="${EMBED}\
${ESC}[3${BASHISH_COLOR0};40m${UNEMBED}$FADE${EMBED}\
${ESC}[0m${UNEMBED}> "
}
