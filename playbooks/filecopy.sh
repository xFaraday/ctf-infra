#!/bin/bash

localfilepath="/home/xfaraday/housing/playbooks/bump.c"
var=$(docker ps | awk 'NR > 1 {print $12}' | sed '$d')

for vars in $var; do
	fulldockpath="{$vars}:/binary"
	docker cp $localpath $fulldockpath 
done
