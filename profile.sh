
# Helper Functions
get_asdf_data_dir() 
{
	ASDF_TREE_COUNT="$(ls -a ~ | grep .asdf | wc -l | sed 's/ *//g')"
	if [ $ASDF_TREE_COUNT -eq 1 ]; then
		echo $HOME/$(ls -a ~| grep .asdf | sed 's/ *//g')
		exit 0
	fi

	SO="$(uname -s)"
	ARCH="$(uname -m)"

	if [ $ARCH = "arm64" -a $SO = "Darwin" ]; then
		echo "$HOME/.asdf"
	elif [ $ARCH = "x86_64" -a $SO = "Linux" ]; then
		echo "$HOME/.asdf"
	else
		echo "$HOME/.asdf-$ARCH"
	fi
}

if [ -d $HOME/bin ]; then
	export PATH=$HOME/bin:$PATH
fi

# asdf (https://asdf-vm.com/)
export ASDF_DATA_DIR=$(get_asdf_data_dir)

if [ -d $ASDF_DATA_DIR ]; then
	. $ASDF_DATA_DIR/asdf.sh
fi

