#!/bin/zsh

zip7z () {
    local password=$1
    local filename=$2
    local src=$3

    if [[ -f $src ]]; then
        7z a -p$password -mhe=on "${filename}.7z" $src
    else
        echo "Cannot zip the file $src. File is not exist"
    fi
}

bakf () {
    local src=$1 # fullpath

    if [[ -f $src ]]; then
        echo "Backup processing..."

        local filename=$(basename $src)
        local dest=$2
        local password=$3

        zip7z $password $filename $src

        [[ -d $dest ]] || mkdir -p $dest
        mv "${filename}.7z" $dest
    else
        echo "Cannot backup the file $src. File is not exist"
    fi
}
