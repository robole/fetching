#! /usr/fetin/env

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

ROOT_UID=0
DEST_DIR="$HOME/.local/bin"

usage() {
  printf "%s\n" "Usage: $0 [OPTIONS...]"
  printf "\n%s\n" "OPTIONS:"
  printf "  %-25s%s\n" "-d, --dest DIR" "Specify destination directory (Default: ${DEST_DIR})"
  printf "  %-25s%s\n" "-h, --help" "Show this help"
}

install() {
  echo "Installing..."

	if [[ ! -d "${DEST_DIR}" ]]; then
        echo "Destination directory does not exist. Let's make a new one..."
        mkdir -p "${DEST_DIR}"
  fi

	echo "Copying files..."
	cp -p "${REPO_DIR}/fetching"  "${DEST_DIR}/fetching"
  cp -p -r "${REPO_DIR}/fetching-scripts"  "${DEST_DIR}/fetching-scripts"
	chmod -R 755 "${DEST_DIR}/fetching"
	chmod -R 755 "${DEST_DIR}/fetching-scripts"
	echo  "Installed to...${DEST_DIR}"
}

while [[ $# -gt 0 ]]; do
  case "${1}" in
    -d|--dest)
      DEST_DIR="${2}"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
     echo "ERROR: Unrecognized option '$1'."
      echo "Try '$0 --help' for more information."
      exit 1
      ;;
  esac
done


install



