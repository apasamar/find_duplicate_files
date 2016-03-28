#!/bin/bash


IFS="
"


if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    echo "Target path is needed"
    echo ""
    echo "Usage: $0 <path>"
    exit 0
fi

path=$1

dir="./files"

if [ -f $dir/files.txt ] ; then 

tar cvfz files_backup.tgz $dir

echo "backup done!"

rm -f $dir/*

ls -lh backup.tgz

else

echo "files.txt does not exist!"

fi

sleep 2

echo "generating files.txt file!"

find $path -type f > $dir/files.txt

echo "file list generated!"

echo "generating Hashes... please wait"

file=$dir'/files.txt'

for myfile in $(cat $file)
        do md5 $myfile >> $dir/hashes.txt
done

echo "file hashes generated!"

file=$dir'/hashes.txt'

for myline in $(cat $file) 
	do echo $myline | sed 's/MD5\ (//' | sed 's/)\ =\ /;/' >> $dir/clean_hashes.txt
done

echo "file and hash csv file generated"

file=$dir'/clean_hashes.txt'

sort -k2 $file > $dir/clean_sort_hashes.txt

echo "files sorted by hash!"

echo "file clean_sort_hashes.txt generated!"

ls -lh "$dir/clean_sort_hashes.txt" 

file "$dir/clean_sort_hashes.txt"

echo "now you can remove duplicates!"
echo ""

echo "execute remove_duplicates.py"
