# Searches through directories and checks if
# any git repos with uncommitted files exist.

function didicommit() {
	RED='\033[1;31m'
	NC='\033[0m'

	for fn in `find /home -name ".git"`; do
		if [ -d "$fn" ]; then
			cd "$fn"
		else
			continue 1
		fi
		cd ..
		pwd
		A=`git status --porcelain`
		B=`echo "$A" | wc -l`
		B+=" files changed"
		printf "${RED}$B${NC}\n"
	done
}
