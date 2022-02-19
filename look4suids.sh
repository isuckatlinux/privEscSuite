#!/bin/bash

echo "[*] Looking for SUIDS..."
exploit_binaries=$(curl -s https://gtfobins.github.io/ | grep -o "gtfobins/.*/#suid" | grep -o "/.*/" | grep -o "[a-zA-Z-]*" | sort -u)

suids=$(find / -perm -4000 2>/dev/null | grep -o '[a-zA-Z.]*$' | sort -u)

for prog in $suids
do
	for bin in $exploit_binaries
	do
		
		if [[ "$prog" == "$bin" ]]; then
			echo "Potential vulnerable SUID privilege: $bin -> https://gtfobins.github.io/gtfobins/$bin"
		fi
	done
done
