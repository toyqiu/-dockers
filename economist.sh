# recipe文件路径
re_path=/books/recipes # 请修改为自己系统中的对应文件夹

cd $re_path
for name in `ls Economist.recipe|awk -F '.' '{print $1}'`
do
        echo -e "\n       正在生成杂志 $name ... \n"
        ebook-convert ${name}.recipe .epub
        sleep 3
        echo -e "\n       将生成的杂志 $name 添加到书库 ... \n"
        calibredb add --with-library /books/ ${name}.epub # 请修改为自己系统中的对应文件夹
		sleep 3
        echo -e "\n       将删除已添加到书库的杂志 ... \n"
		rm -rf ${name}.epub
done
