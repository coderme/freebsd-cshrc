# $FreeBSD: releng/9.2/etc/root/dot.cshrc 244005 2012-12-08 00:25:51Z eadler $
#
# .cshrc - csh resource script, read at beginning of execution by each shell
#
# see also csh(1), environ(7).
# more examples available at /usr/share/examples/csh/
#

# Some useful Aliases.
alias rm 	'rm -i'
alias mv 	'mv -i'
alias cp 	'cp -i'
alias h		'history 25'
alias j		'jobs -l'
alias ls	'ls -FGh'
alias la	'ls -aFGh'
alias lf	'ls -FAGh'
alias ll	'ls -lAFGh'
alias ..	'cd ..'
alias ...	'cd ../../'
# some typos make sense :)
alias cd..	'cd ..'
alias pp	'portsnap fetch && portsnap update'
alias c		'clear'
alias prev 	'history | grep \!^'
alias tree	'tree -C'
alias old	'pkg version -l "<"'


# A righteous umask
umask 22

set path = (/sbin /bin /usr/sbin /usr/bin /usr/games /usr/local/sbin /usr/local/bin $HOME/bin)

setenv	EDITOR	vi
#setenv	PAGER	more
setenv	PAGER 	less
setenv	BLOCKSIZE	K
setenv  LSCOLORS	'Exfxcxdxbxegedabagacad'

if ($?prompt) then
	# An interactive shell -- set some stuff up
	set prompt = "%N@%m:%~ %# "
	set promptchars = "%#"

	set filec
	set history = 1000
	set savehist = (1000 merge)
	set histdup  = erase
	set autolist = ambiguous
	# Use history to aid expansion
	set autoexpand
	set autorehash
	set mail = (/usr/home/$USER)
	if ( $?tcsh ) then
		bindkey "^W" backward-delete-word
		bindkey -k up history-search-backward
		bindkey -k down history-search-forward
		bindkey '^[[3~' backward-delete-word
	endif

