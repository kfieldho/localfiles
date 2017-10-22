#!/bin/bash
__fzf_history__() {
	line=$(cat ~/.logs/* | sort -r | fzf | awk '{ $1=$2=$3="" ; print $0 }')	
	echo $line
}
