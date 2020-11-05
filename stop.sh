#!/bin/bash

var=$(docker ps | awk 'NR > 1 {print $1}' | sed '$d')
        
for vars in $var; do
	docker stop $vars
done
