# 1. 递归查找当前文件夹下的所有HTML文件
# 2. 将第一步查询到的文件压缩为zip文件（需要能够处理带空格的文件名）

# 当文件名中不包含空格时，此命令可以正常处理
# find . -name "*.html" | xargs zip -r res.zip

# 为什么需要考虑带空格的文件名？
# 答：find的结果可能是多个条目，那么多个条目之间一定是存在分隔符的，分隔符包括单引号、双引号、反斜杠、空格、Tab和换行符。同时，xargs是需要分割多个参数的，xargs默认采用的分隔符是空格和换行符。此时如果存在一个名字带空格的文件，xargs会把一个文件名分割为多个文件名，因此需要处理这种情况

# find的-X选项或-print0会把条目之间的分隔符修改为空字符（ASCII为0），同时xargs使用-0选项将采用的分隔符同样修改为空字符，即可解决上述问题。即以下命令可满足名字带空格的文件的正常find和compress
find . -name "*.html" -print0 | xargs -0 zip -r res_right.zip

# 如何验证-print0选项，通过hexdump即可查看到实际采用的分隔符
# find . -name "*.html" > ori.txt
# find . -name "*.html" -print0 > edi.txt
# diff <(hexdump -C ori.txt) <(hexdump -C edi.txt)
