#!/bin/sh
HITS=$(grep -e REVALIDATED -e HIT /var/log/nginx/access.log | awk '{print $10}' | awk '{ sum += $1 } END { printf "%.3f",  sum/(1024^3) }')
MISSES=$(grep -e MISS -e EXPIRED /var/log/nginx/access.log | awk '{print $10}' | awk '{ sum += $1 } END { printf "%.3f", sum/(1024^3) }')

if [ -e /var/log/nginx/access.log-nocache ]
then
	NOCACHE=$(awk '{ sum += $9 } END { printf "%.3f", sum/(1024^3) }'  /var/log/nginx/access.log-nocache)
fi

echo "MISS/EXPIRED: $MISSES GiB"
echo "HIT/REVALIDATED: $HITS GiB"
if [ -n "$NOCACHE" ]
then
	echo "Requests not matching cache rules: $NOCACHE GiB"
fi
