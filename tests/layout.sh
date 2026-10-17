#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

wide_output="$(COLUMNS=1000 ./bfetch)"
narrow_output="$(COLUMNS=89 ./bfetch)"
threshold_output="$(COLUMNS=90 ./bfetch)"

wide_first_line="${wide_output%%$'\n'*}"
narrow_first_line="${narrow_output%%$'\n'*}"
threshold_first_line="${threshold_output%%$'\n'*}"

[[ "$wide_first_line" == *"OS:"* && "$wide_first_line" == *"▀"* ]]
[[ "$narrow_first_line" == *"▀"* && "$narrow_first_line" != *"OS:"* ]]
[[ "$threshold_first_line" == *"OS:"* && "$threshold_first_line" == *"▀"* ]]

narrow_os_line="$(grep -m1 'OS:' <<<"$narrow_output")"
[[ "$narrow_os_line" != *"▀"* ]]
