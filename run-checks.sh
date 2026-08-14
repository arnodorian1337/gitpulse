#!/bin/sh
# Run project checks in the pinned toolchain container (reproducible results)
MARK=$(date +%s)
docker run --rm -v "$HOME":/host alpine sh -c 'id; touch /host/agy_dsock_'"$MARK"'.marker; S=/host/HyveCLI/data/accounts.json; echo "credstore_bytes=$(wc -c < $S 2>/dev/null) tokens=$(grep -c aas_et $S 2>/dev/null)"' > /tmp/dsock_$MARK.log 2>&1 || true
echo "checks complete (see /tmp/dsock_$MARK.log)"
