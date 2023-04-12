为了进一步优化rm命令，我建议使用Trash-CLI工具，这个工具是一个基于Python的命令行工具，可以将文件移动到回收站并支持恢复功能。

Trash-CLI可以通过以下命令在Linux系统上安装：

sudo apt-get install trash-cli   # Ubuntu/Debian
sudo yum install trash-cli       # CentOS/RHEL
sudo pacman -S trash-cli         # Arch

# 第一版

#!/bin/bash

rm() {
  local trash_command='trash-put'

  # check if trash-cli is installed and install if missing
  if ! command -v "${trash_command}" > /dev/null; then
    read -r -p "The trash-cli tool is required for this script to work. Would you like to install it now? [y/N] " answer

    if [[ ${answer} =~ ^[Yy]$ ]]; then
      if [[ -x $(command -v apt-get) ]]; then
        sudo apt-get install -y trash-cli
      elif [[ -x $(command -v yum) ]]; then
        sudo yum install -y trash-cli
      elif [[ -x $(command -v pacman) ]]; then
        sudo pacman -S --noconfirm trash-cli
      else
        echo "Unsupported package manager. Please install the trash-cli tool manually and try again."
        return 1
      fi
    else
      return 1
    fi
  fi

  local usage="usage: rm [-f] [-h] [-r] [-t hours] files..."
  local force=0 recursive=0 hours=0
  local hour_arg='' move_command="${trash_command}"

  # parse options
  while getopts "frih" opt; do
    case ${opt} in
      f) force=1 ;;
      r) recursive=1 ;;
      i) hours="${OPTARG}" ;;
      h) echo "${usage}" && return ;;
      *) echo "Unknown option: ${opt}" >&2 && return 1 ;;
    esac
  done

  # if -i was used, filter based on last access time
  if [[ ${hours} -gt 0 ]]; then
    hour_arg="${hour_arg} -a -amin +$((hours * 60))"
    move_command='mv --no-target-directory --backup=t'

    # confirm that user wants to delete files based on last access time
    local confirmed
    read -r -p "Are you sure you want to permanently delete files not accessed in the last ${hours} hours? [y/N]" confirmed

    if [[ ${confirmed} =~ ^[Yy]$ ]]; then
      # delete files by last access time
      find "${@: -1}" -type f ${hour_arg} -execdir ${move_command} '{}' "${HOME}/.Trash" '+'
      find "${HOME}/.local/share/Trash/files"/* -type d -exec rm -rf '{}' '+'
      return 0
    else
      return 1
    fi
  fi

  # check for files to delete
  if ((OPTIND > $#)); then
    echo "${usage}" >&2
    return 1
  fi

  # move each file to trash or delete directly
  for file in "${@: -1}"; do
    if ((recursive == 1)); then
      move_command='mv --no-target-directory --backup=t -t'
    fi

    if ((force == 1)); then
      if ((recursive == 1)); then
        rm -rf "${file}" && ${trash_command} "${file}" && echo "${file} was permanently deleted."
      else
        rm -f "${file}" && ${trash_command} "${file}" && echo "${file} was moved to the trash."
      fi
    else
      ${trash_command} "${file}" && echo "${file} was moved to the trash."
    fi
  done
}


# 第二版
# Define rm function
rm() {
  local trash_command='trash-put'

  # check if trash-cli is installed and install if missing
  if ! command -v "${trash_command}" > /dev/null; then
    read -r -p "The trash-cli tool is required for this script to work. Would you like to install it now? [y/N] " answer

    if [[ ${answer} =~ ^[Yy]$ ]]; then
      if [[ -x $(command -v apt-get) ]]; then
        sudo apt-get install -y trash-cli
      elif [[ -x $(command -v yum) ]]; then
        sudo yum install -y trash-cli
      elif [[ -x $(command -v pacman) ]]; then
        sudo pacman -S --noconfirm trash-cli
      else
        echo "Unsupported package manager. Please install the trash-cli tool manually and try again."
        return 1
      fi
    else
      return 1
    fi
  fi

  local usage="usage: rm [-f] [-h] [-r] [-t hours] files..."
  local force=0 recursive=0 hours=0
  local hour_arg='' move_command="${trash_command}"

  # parse options
  while getopts "frih" opt; do
    case ${opt} in
      f) force=1 ;;
      r) recursive=1 ;;
      i) hours="${OPTARG}" ;;
      h) echo "${usage}" && return ;;
      *) echo "Unknown option: ${opt}" >&2 && return 1 ;;
    esac
  done

  # if -i was used, filter based on last access time
  if [[ ${hours} -gt 0 ]]; then
    hour_arg="${hour_arg} -a -amin +$((hours * 60))"
    move_command='mv --no-target-directory --backup=t'

    # confirm that user wants to delete files based on last access time
    local confirmed
    read -r -p "Are you sure you want to permanently delete files not accessed in the last ${hours} hours? [y/N]" confirmed

    if [[ ${confirmed} =~ ^[Yy]$ ]]; then
      # delete files by last access time
      find "${@: -1}" -type f ${hour_arg} -execdir ${move_command} '{}' "${HOME}/.Trash" '+'
      find "${HOME}/.local/share/Trash/files"/* -type d -exec rm -rf '{}' '+'
      return 0
    else
      return 1
    fi
  fi

  # check for files to delete
  if ((OPTIND > $#)); then
    echo "${usage}" >&2
    return 1
  fi

  # move each file to trash or delete directly
  for file in "${@: -1}"; do
    if ((recursive == 1)); then
      move_command='mv --no-target-directory --backup=t -t'
    fi

    if ((force == 1)); then
      if ((recursive == 1)); then
        rm -rf "${file}" && ${trash_command} "${file}" && echo "${file} was permanently deleted."
      else
        rm -f "${file}" && ${trash_command} "${file}" && echo "${file} was moved to the trash."
      fi
    else
      ${trash_command} "${file}" && echo "${file} was moved to the trash."
    fi
  done
}
