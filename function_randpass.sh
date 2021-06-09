function randpass(){
	openssl rand -base64 ${1:-16} | cut -b -${1:-16}
}
