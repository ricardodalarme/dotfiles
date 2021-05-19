function proxy_on() {
    #export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
    export no_proxy=""

    if (( $# > 0 )); then
		# TODO: validate `localhost` address
        valid=$(echo $@ | sed -n 's/\([0-9]\{1,3\}.\?\)\{4\}:\([0-9]\+\)/&/p')
        if [[ $valid != $@ ]]; then
            >&2 echo "Invalid address"
            return 1
        fi
        local proxy=$1
        export http_proxy="$proxy" \
               https_proxy=$proxy \
               ftp_proxy=$proxy \
               rsync_proxy=$proxy \
			   HTTP_PROXY=$proxy \
			   HTTPS_PROXY=$proxy \
			   FTP_PROXY=$proxy \
			   RSYNC_PROXY=$proxy

		# TODO: cli option --gnome 
		# gsettings set org.gnome.system.proxy mode 'none' 
		# for proto in "http" "https" "ftp" "socks"; do
		# 	gsettings set org.gnome.system.proxy.$proto host ""
		# 	gsettings set org.gnome.system.proxy.$proto port 0
		# done

        echo "Proxy environment variable set."
        return 0
    fi

    #echo -n "username: "; read username
    #if [[ $username != "" ]]; then
    #    echo -n "password: "
    #    read -es password
    #    local pre="$username:$password@"
    #fi

    #echo -n "server: "; read server
    #echo -n "port: "; read port
    #local proxy=$pre$server:$port
	local proxy="127.0.0.1:1984"
	proxy_on $proxy
	return $?
}

function proxy_off(){
    unset http_proxy https_proxy ftp_proxy rsync_proxy \
          HTTP_PROXY HTTPS_PROXY FTP_PROXY RSYNC_PROXY

	# TODO: cli option --gnome
	# gsettings set org.gnome.system.proxy mode 'none' 
	# for proto in "http" "https" "ftp" "socks"; do
	# 	gsettings set org.gnome.system.proxy.$proto host ""
	# 	gsettings set org.gnome.system.proxy.$proto port 0
	# done

    echo -e "Proxy environment variable removed."
}
