#!/bin/bash

usernames=$(cat usernames.txt)

for i in $usernames; do
	rm -rf $i
	docker rm $i $i 
done

