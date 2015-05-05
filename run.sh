#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

numP=0
numT=0

for i in $(ls input | sort -n); do
    $(./executeit < ./input/$i > ./output/o$i)
    DIFF=$(diff ./output/$i ./output/o$i)
    let "numT += 1"
    if [ -z "$DIFF" ]; then
	let "numP += 1"
	echo -e "${GREEN}$i - PASSED${NC}"
    else
	echo -e "${RED}$i - FAILED${NC}"
    fi
done
      
echo "PASSED $numP/$numT tests" 
     
