# Searches through directories and checks if
# any git repos with uncommitted files exist.

function didicommit() {
	local RED='\033[1;31m'
	local NC='\033[0m'

	for fn in `find /home -name ".git"`; do
		if [ -d "$fn" ]; then
			cd "$fn"
			cd ..
			local A=$(git status --porcelain)
			local B=$(echo "$A" | sed 1d | wc -l)
			B+=" files changed"
			if [[ $B != 0* ]]; then
				pwd
				printf "${RED}$B${NC}\n\n"
			fi
		fi
	done
}
