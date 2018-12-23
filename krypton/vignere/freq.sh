LENGTH=$1
FILE=$2

for i in $(seq $LENGTH); do
	echo "${i} --- "
	cat $FILE | sed "s/./&\n/g" | sed -n "${i}~${LENGTH}p" | 
		sort | uniq -c | sort -n | tail -5 # | sed -n '$p' | awk '{print $2}'
done

