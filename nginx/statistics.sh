#!/bin/sh
HITS=$(grep -e REVALIDATED -e HIT /var/log/nginx/access.log | awk '{print $5}' | awk '{ sum += $1 } END { print sum/(1024^3) }')
MISSES=$(grep -e MISS /var/log/nginx/access.log | awk '{print $10}' | awk '{ sum += $1 } END { print sum/(1024^3) }')
NOCACHE=$(awk '{ sum += $9 } END { print sum/(1024^3) }'  /var/log/nginx/access.log-nocache)

echo "MISS: $MISSES GiB"
echo "HIT/REVALIDATED: $HITS GiB"
echo "Requests not matching cache rules: $NOCACHE GiB"
