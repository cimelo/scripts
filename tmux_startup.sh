if $(tmux ls &>/dev/null); then
	tmux a
else 
	tmux new-session \; run-shell $HOME/.config/tmux/plugins/tmux-continuum/scripts/continuum_restore.sh
fi
