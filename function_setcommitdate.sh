#!/bin/bash
function setcommitdate() {
	if [ $# -eq 0 ]; then
		echo "Change last commit date to specified date"
		echo ""
		echo "usage: setcommitdate <DATE>"
		echo "       e.g. comitat \"\`date -v-4H\`\""
		return 1
	fi

	GIT_COMMITTER_DATE="$1" git commit --amend --no-edit --date "$1"
}

