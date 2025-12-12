#!/usr/bin/env bash

set -euo pipefail

ICON_DIR="$1"
OUTPUT_FILE="$2"

if [ ! -d "$ICON_DIR" ]; then
  echo "Directory not found: $ICON_DIR" >&2
  exit 1
fi

{
  echo "/**"

  # Loop over all .svg files in the folder
  for file in "$ICON_DIR"/*.svg; do
    # If no .svg files match, bash will leave the pattern unchanged
    [ -e "$file" ] || continue

    filename="$(basename "$file")"
    basename_no_ext="${filename%.svg}"

    # Convert kebab-case to camelCase (bubble-bath => bubbleBath)
    IFS='-' read -ra parts <<< "$basename_no_ext"

    # Skip empty or weird names
    if [ "${#parts[@]}" -eq 0 ]; then
      continue
    fi

    method="${parts[0]}"

    # Uppercase first letter of subsequent parts
    for ((i=1; i<${#parts[@]}; i++)); do
      part="${parts[$i]}"
      first_char="${part:0:1}"
      rest="${part:1}"
      method+="${first_char^^}${rest}"
    done

    method+="Html"

    # If method starts with a digit, you may want to skip or adjust.
    # For now, we'll just skip those (very rare if you've normalized well).
    if [[ "$method" =~ ^[0-9] ]]; then
      echo " * Skipping invalid method name (starts with digit): $method for file $filename" >&2
      continue
    fi

    echo " * @method string ${method}(string \$classnames = '', ?int \$width = 24, ?int \$height = 24, array \$attributes = [])"
  done

  echo " */"
} > "$OUTPUT_FILE"

echo "Generated docblock for '$ICON_DIR' into '$OUTPUT_FILE'"
