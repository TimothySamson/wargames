BLOB=$(cat $1)
SIZE=$2
LEN=${#BLOB}

for i in $(seq $((LEN-SIZE))); do 
	printf "${BLOB:$i:$SIZE}\n";
done



