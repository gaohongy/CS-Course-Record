#!/usr/bin/env bash

# 统计script执行次数
cnt=0

# 第一次执行脚本
# 需要注意的是此处用的是重定向，循环中使用的是追加
./script.sh 1> stdout.txt 2> stderr.txt
res=$?
cnt=$(($cnt+1))

# 脚本未执行出错则持续进行
while [[ res -eq 0 ]]
do
	./script.sh 1>> stdout.txt 2>> stderr.txt
	res=$?
	cnt=$(($cnt+1))
done

echo -e "stdout.txt:\n$(cat stdout.txt)"
echo -e "stderr.txt:\n$(cat stderr.txt)"
echo "excute ${cnt} times"
