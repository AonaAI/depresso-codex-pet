#!/usr/bin/env sh
set -eu

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
target_root=${CODEX_PET_DIR:-"$HOME/.codex/pets"}
target_dir="$target_root/depresso"

if [ ! -f "$script_dir/depresso/pet.json" ] || [ ! -f "$script_dir/depresso/spritesheet.webp" ]; then
  echo "This installer must be run from the extracted release folder." >&2
  exit 1
fi

mkdir -p "$target_root"

if [ -e "$target_dir" ]; then
  backup_dir="$target_root/depresso-backup-$(date +%Y%m%d%H%M%S)"
  mv "$target_dir" "$backup_dir"
  echo "Existing pet backed up to: $backup_dir"
fi

cp -R "$script_dir/depresso" "$target_dir"
echo "Installed Depresso to: $target_dir"
echo "Open ChatGPT → Settings → Pets → Refresh, select Depresso, then use /pet."
