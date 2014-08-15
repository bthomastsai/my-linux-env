#!/bin/bash

CSCOPE_FILE=cscope.file
OUTPUT_FILE=cscope.out

if [ -n "$2" ]; then
    OUTPUT_FILE=$2
fi

if [ -n "$1" ]; then
	echo "Source code directory: " $1
	echo "Create file map : " $CSCOPE_FILE
    # you can modify here for your source file suffix
    # Android
	find $1 -name "*.aidl" \
            -o -name "*.cc" \
            -o -name "*.h" \
            -o -name "*.c" \
            -o -name "*.cpp" \
            -o -name "*.java" \
            -o -name "*.mk" \
            -o -name "*.m" \
            -o -name "*.mm" \
            > $CSCOPE_FILE
	cscope -bk -i $CSCOPE_FILE -f $OUTPUT_FILE
##	ctags -R --exclude=.svn
else
	echo "Please key-in path of project"
fi

