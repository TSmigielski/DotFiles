#!/usr/bin/env bash
# Compare every file in ./etc against its counterpart in /etc and report differences.
# Usage: ./check-etc.sh   (run with sudo if some /etc files aren't readable)

set -uo pipefail

src="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/etc"

if [[ ! -d "$src" ]]; then
    echo "No etc directory found at $src" >&2
    exit 1
fi

mismatched=0 missing=0 unreadable=0 ok=0

while IFS= read -r -d '' file; do
    rel="${file#"$src"/}"
    target="/etc/$rel"

    if [[ ! -e "$target" ]]; then
        echo "MISSING     $target"
        ((missing++))
    elif [[ ! -r "$target" ]]; then
        echo "UNREADABLE  $target"
        ((unreadable++))
    elif [[ "$(sha256sum < "$file")" != "$(sha256sum < "$target")" ]]; then
        echo "DIFFERS     $target"
        ((mismatched++))
    else
        ((ok++))
    fi
done < <(find "$src" -type f -print0 | sort -z)

echo
echo "OK: $ok  Differs: $mismatched  Missing: $missing  Unreadable: $unreadable"

(( mismatched + missing + unreadable == 0 ))
