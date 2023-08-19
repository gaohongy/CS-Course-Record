# marco会获取到当前路径，为了polo能够在任意目录获取到marco的执行路径，只能将数据放置到一个公共区域，即系统的环境变量

marco() {
	# ls -a -h -u -t -G -l > curdir.txt
	export MARCO_DIR=$(pwd)
}

polo() {
	cd ${MARCO_DIR}
	unset MARCO_DIR	
}
