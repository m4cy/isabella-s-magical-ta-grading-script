#!/usr/bin/env bash

# 1. list of scenarios stored in one folder
# 2. student programs stored in another folder
# 3. this script manually runs all scenarios and stores to student_name.txt

while getopts p:s: flag
do
    case "${flag}" in
        p) pd=${OPTARG};;
        s) sd=${OPTARG};;
    esac
done

mkdir studentgrades
echo "student programs directory: $pd"
echo "scenario directory: $sd"

for PROGRAM in "$pd"/*
    do STUDENT=$(cat $PROGRAM | grep '@author' | sed 's/^.*: //')
    echo "////////// STUDENT: $STUDENT //////////"
    for SCENARIO in "$sd"/*
        do echo $SCENARIO
        python $PROGRAM < $SCENARIO || echo 'student code broke'
    done
    echo ""
done > output.txt
