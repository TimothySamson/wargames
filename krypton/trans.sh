# Give a string of letters separated by new line. Output the number
# representation, mod 26

while read line; do
	printf '%d' "'$line" | 
		awk -v trans="$1" '{$1=(($1 + trans) - 65) % 26 + 65; $1=($1 - 65 < 0) ? $1 + 26 : $1}1'
done < "${2:-/dev/stdin}"
