function exportenv() {
	# fails on SMTP_EMAIL_ALIAS="Delivery Center - Acompanhe seu pedido"
	export $(cat $1 | sed 's/#.*//g' | xargs -0) 

	# fails on OPERATION_JOBS_INTEGRATE="*/1 * * * *"
	# set -o allexport; source $1; set +o allexport 
}
