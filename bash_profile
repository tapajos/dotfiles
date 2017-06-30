#Bash profile by Tapajos

if [ "$PS1" ]; then
	for resource in $HOME/dotfiles/profile/*; do
		source "$resource"
	done
fi
