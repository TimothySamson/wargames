while read line; do
	awk -v num=$line 'BEGIN {printf "%c\n", num}'
done < "${1:-/dev/stdin}"
