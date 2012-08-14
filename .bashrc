# /etc/bash/bashrc
#
ttyname=`tty | cut -b 6-`
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi
export PATH=$PATH:/usr/sbin:/sbin
# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

#==============================================================================
# nullglob
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Non-matching pattern `glob` as null
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#shopt -s nullglob
#------------------------------------------------------------------------------

#==============================================================================
# extglob WILDCARD
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
shopt -s extglob
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ?(pattern-list)    Zero or one of the patterns
# *(pattern-list)    Zero or more of the patterns
# +(pattern-list)    One or more of the patterns
# @(pattern-list)    Exactly one of the patterns
# !(pattern-list)    Anything except one of the patterns
#------------------------------------------------------------------------------

#==============================================================================
# nocaseglob    Case Insensitive Globbing
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#shopt -s nocaseglob
#------------------------------------------------------------------------------


# Enable history appending instead of overwriting.  #139609
shopt -s histappend
shopt -s cmdhist

# Change the window title of X terminals
case ${TERM} in
	konsole|xterm*|rxvt*|Eterm|aterm|kterm|gnome*|interix)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
		;;
	screen)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"'
		;;
esac

use_color=true

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
	&& type -P dircolors >/dev/null \
	&& match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

if ${use_color} ; then
	# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
	if type -P dircolors >/dev/null ; then
		if [[ -f ~/.dir_colors ]] ; then
			eval $(dircolors -b ~/.dir_colors)
		elif [[ -f /etc/DIR_COLORS ]] ; then
			eval $(dircolors -b /etc/DIR_COLORS)
		fi
	fi

	if [[ ${EUID} == 0 ]] ; then
		PS1='\[\033[01;31m\]\u\[\033[01;34m\] \W \$\[\033[00m\] '
	else
		PS1='\[\033[01;32m\]\u \e[01;36m\]$ttyname \[\033[01;34m\]\W \$\[\033[00m\] '
	fi
else
	if [[ ${EUID} == 0 ]] ; then
		# show root@ when we don't have colors
		PS1='\u@\h \W \$ '
	else
		PS1='\u@\h \w \$ '
	fi
fi

#alias ls='ls --color=auto'
export LS_OPTIONS="--color=auto"
alias udm='udisks --mount'
alias grep='grep --colour=auto'
alias mpdk='mpd --kill'

# Try to keep environment pollution down, EPA loves us.
unset use_color safe_term match_lhs
#export GTK_IM_MODULE=ibus
#export XMODIFIERS=@im=ibus
#export QT_IM_MODULE=ibus
export GTK_IM_MODULE=xim
export XMODIFIERS="@im=unikey"
export QT_IM_MODULE=xim
# Less Colors for Man Pages
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline
#if [ -e /usr/share/terminfo/x/xterm-256color ]; then
#	export TERM='xterm-256color'
#else
#	export TERM='xterm-color'
#fi
[ -n "$XTERM_VERSION" ] && transset -a > /dev/null

# append, don't overwrite the history
#shopt -s histappend

# control the size of the history file
#export HISTSIZE=100000
#export HISTFILESIZE=409600

# ignore commond commands
export HISTIGNORE=":pwd:id:uptime:resize:ls:clear:history:"

# ignore duplicate entries
export HISTCONTROL=ignoredups

# vim: set ff=unix ft=sh fenc=utf-8 ts=4 sw=4 tw=79 :
