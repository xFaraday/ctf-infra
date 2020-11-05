#!/bin/bash

var=$(docker ps | awk 'NR > 1 {print $12}' | sed '$d')

for vars in $var; do
	temp=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $vars)
	ports=$(docker port $vars)
	echo "| $temp" >> address
	echo "|>$ports" >> address
done
