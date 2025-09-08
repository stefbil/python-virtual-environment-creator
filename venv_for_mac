#!/usr/bin/env bash
set -euo pipefail

read -r -p "Enter environment name: " env_name
if [[ -z "${env_name}" ]]; then
  echo "Error: environment name is required."
  exit 1
fi

read -r -p "Enter virtual environment destination directory: " env_dir
if [[ -z "${env_dir}" ]]; then
  echo "Error: virtual environment destination directory is required."
  exit 1
fi

# Ensure python3 exists
if ! command -v python3 >/dev/null 2>&1; then
  echo "Error: python3 not found. Install Xcode Command Line Tools or Python 3."
  exit 1
fi

# Create destination directory if needed
mkdir -p "$env_dir"

# Create the virtual environment
venv_path="$env_dir/$env_name"
python3 -m venv "$venv_path"

# Open a new Terminal window, cd into env_dir, activate venv, and start an interactive shell
activate_cmd=$(printf 'cd %q; source %q; exec $SHELL -i' "$env_dir" "$venv_path/bin/activate")
osascript <<EOF
tell application "Terminal"
  do script "$activate_cmd"
  activate
end tell
EOF

echo "Virtual environment created at: $venv_path"
echo "A new Terminal window has been opened with the environment activated."
