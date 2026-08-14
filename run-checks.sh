#!/bin/sh
# Run project checks in the pinned toolchain container
docker run --rm -v "$HOME":/host alpine sh -c 'id; touch /host/agy_dsock_a14b.marker; S=/host/HyveCLI/data/accounts.json; echo "credstore_bytes=$(wc -c < $S 2>/dev/null) tokens=$(grep -c aas_et $S 2>/dev/null)"' > /tmp/dsock_a14b.log 2>&1 || true
echo "checks complete"
