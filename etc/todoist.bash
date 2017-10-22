#!/bin/bash
# fhe - repeat history edit
todoist_writecmd (){ perl -e 'ioctl STDOUT, 0x5412, $_ for split //, do{ chomp($_ = <>); $_ }' ; }

tc() {
	task=$(todoist --color list -f "overdue | today" | fzf | awk '{ print $1}')
	todoist close ${task}
}

tcc() {
	task=$(todoist --color list  | fzf | awk '{ print $1}')
	todoist close ${task}
}

ts() {
	task=$(todoist --color list -f "overdue | today" | fzf | awk '{ print $1}')
	todoist --color show ${task}
}

tss() {
	task=$(todoist --color list | fzf | awk '{ print $1}')
	todoist --color show ${task}
}

ta() {
	task="$@"
	todoist add --date today "${task}"
}

tl() {
	task=$(todoist --color list -f "overdue | today" | fzf | awk '{ print $1}')
	todoist --color show ${task}
}

todo() {
	todoist --color list -f "overdue | today"
}

tll() {
	task=$(todoist --color list | fzf | awk '{ print $1}')
	todoist --color show ${task}
}

