#!/bin/bash
# Run this bash script to dump version files
# Please run it within the root directory that contains mnt and stg
# Also, make sure you give it executable permission with chmod +x
# USAGE: ./dump.sh mnt/file.txt
 

FILENAME="$(basename ${1})"
MOUNTDIR="${PWD}/mnt"
STGDIR="${PWD}/stg"
MOUNTTARGET="${PWD}/$1"
STGTARGET="${STGDIR}/${FILENAME}"

RUN="true"
VERSIONNUMBER=1

while :
do	
	if test -f "${STGTARGET}.ver${VERSIONNUMBER}"; then	
		echo "Dumping ${STGTARGET}.ver${VERSIONNUMBER}"
		cp "${STGTARGET}.ver${VERSIONNUMBER}" "${MOUNTTARGET},${VERSIONNUMBER}"
	else
		break
	fi

	((VERSIONNUMBER++))
done

