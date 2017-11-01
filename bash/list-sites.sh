#!/bin/bash
# This script will count the number of livesites you have on server and list
# them if required. Supports only nginx.

# file count
cnt=0
: "${site_dir:=/etc/nginx/sites-enabled}"
while test $# -gt 0; do
    case "$1" in
            -h|--help)
                echo "$package - list the live sites on a server"
                echo " "
                echo "$package [options] application [arguments]"
                echo " "
                echo "options:"
                echo "-h, --help                show brief help"
                echo "-d, --directory=DIR"
                exit 0
                ;;
            -d|--directory)
                shift
                if test $# -gt 0; then
                    site_dir=$1
                fi
                shift
                ;;
            *)
                break
                ;;
    esac
done

# list of files
for file in "$site_dir"/*
do
    if [ -e $file ]; then
        file_list[$cnt]=$file
        ((++cnt))
    fi
done

echo "No. of active sites: ${#file_list[@]}"

for i in "${file_list[@]}"
do
    while IFS='/' read -ra file_sep; do
        echo ${file_sep[-1]}
    done <<< $i
done