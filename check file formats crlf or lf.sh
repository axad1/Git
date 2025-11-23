#!/bin/bash
set -e

echo "Checking line endings in repo..."

# Find all text files tracked by git
for file in $(git ls-files); do
  # Skip binary files
  if grep -Iq . "$file"; then
    if dos2unix < "$file" >/dev/null 2>&1; then
      # Detect CRLF
      if file "$file" | grep -q "CRLF"; then
        echo "CRLF : $file"
      else
        # Check for LF explicitly
        if file "$file" | grep -q "ASCII text"; then
          if grep -U $'\r' "$file" >/dev/null; then
            echo "CRLF : $file"
          else
            echo "LF   : $file"
          fi
        fi
      fi
    fi
  fi
done
