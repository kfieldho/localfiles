#!/bin/bash
# fhe - repeat history edit
todoist_writecmd (){ perl -e 'ioctl STDOUT, 0x5412, $_ for split //, do{ chomp($_ = <>); $_ }' ; }

tc() {
	task=$(todoist --color list -f "overdue | today" | fzf | awk '{ print $1}')
	echo "todoist close ${task}" | todoist_writecmd
}

tcc() {
	task=$(todoist --color list  | fzf | awk '{ print $1}')
	echo "todoist close ${task}" | todoist_writecmd
}

ts() {
	task=$(todoist --color list -f "overdue | today" | fzf | awk '{ print $1}')
	echo "todoist --color show ${task}" | todoist_writecmd
}

tss() {
	task=$(todoist --color list | fzf | awk '{ print $1}')
	echo "todoist --color show ${task}" | todoist_writecmd
}

ta() {
	task="$@"
	todoist add --date today "${task}"
}

tl() {
	task=$(todoist --color list -f "overdue | today" | fzf | awk '{ print $1}')
	echo "${task}"
}

todo() {
	todoist --color list -f "overdue | today"
}

tll() {
	task=$(todoist --color list | fzf | awk '{ print $1}')
	echo "${task}"
}

