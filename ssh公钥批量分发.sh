脚本使用方法

创建 vim ssh-key-distrib.sh 并添加一下内容，再创建一个要远程免密登录的主机用户名和地址，比如 hostlist.txt 里面写的是主机地址 192.168.1.1
执行./ssh-key-distrib.sh -h 

#!/bin/bash

# check if ssh client is installed
function check_ssh_client {
  if ! type ssh > /dev/null 2>&1; then
    echo "SSH client is not installed on this machine."
    exit 1
  fi
}

# check if ssh-agent is running
function check_ssh_agent {
  if ! ssh-add -l >/dev/null 2>&1; then
    echo "SSH agent is not running on this machine."
    exit 1
  fi
}

# print script usage instructions
function print_usage {
  echo "Usage: $0 -u <user> -h <host_file> [-p <port>] -i <identity_file>"
}

# handle script arguments
function handle_arguments {
  while getopts ":u:h:p:i:" opt; do
    case $opt in
      u) user=$OPTARG ;;
      h) host_file=$OPTARG ;;
      p) port=$OPTARG ;;
      i) identity_file=$OPTARG ;;
      \?) echo "Invalid option -$OPTARG" >&2 ; print_usage ; exit 1 ;;
      :) echo "Option -$OPTARG requires an argument" >&2 ; print_usage ; exit 1 ;;
    esac
  done

  # make sure required arguments are provided
  if [ -z "$user" ] || [ -z "$host_file" ] || [ -z "$identity_file" ]; then
    echo "Missing required argument(s)." >&2 ; print_usage ; exit 1
  fi

  # set default port to 22 if not provided
  [ -z "$port" ] && port=22

  # make sure identity file exists
  if [ ! -f "$identity_file" ]; then
    echo "Identity file not found: $identity_file" >&2 ; exit 1
  fi

  # make sure host file exists
  if [ ! -f "$host_file" ]; then
    echo "Host file not found: $host_file" >&2 ; exit 1
  fi
}

# distribute public key to a remote host
function distribute_key {
  host=$1

  echo "Distributing SSH public key to $host..."

  # use ssh-copy-id to copy public key to remote host
  ssh-copy-id -i "$identity_file" -p "$port" "$user@$host" > /dev/null 2>&1

  # check if ssh-copy-id command was successful
  if [ $? -eq 0 ]; then
    echo "SSH public key distributed successfully to $host."
  else
    echo "Failed to distribute SSH public key to $host." >&2
  fi
}

# main script execution
function main {
  check_ssh_client
  check_ssh_agent
  handle_arguments "$@"

  # read list of hosts and store them in an array
  hosts=($(awk '{ print $1 }' "$host_file"))

  # distribute public key to each host
  for host in "${hosts[@]}"; do
    distribute_key "$host"
  done
}

# execute main function with script arguments
main "$@"
root@k8smaster:~#
root@k8smaster:~# ls
snap  ssh-key-distrib.sh
root@k8smaster:~# cat ssh-key-distrib.sh
#!/bin/bash

# check if ssh client is installed
function check_ssh_client {
  if ! type ssh > /dev/null 2>&1; then
    echo "SSH client is not installed on this machine."
    exit 1
  fi
}

# check if ssh-agent is running
function check_ssh_agent {
  if ! ssh-add -l >/dev/null 2>&1; then
    echo "SSH agent is not running on this machine."
    exit 1
  fi
}

# print script usage instructions
function print_usage {
  echo "Usage: $0 -u <user> -h <host_file> [-p <port>] -i <identity_file>"
}

# handle script arguments
function handle_arguments {
  while getopts ":u:h:p:i:" opt; do
    case $opt in
      u) user=$OPTARG ;;
      h) host_file=$OPTARG ;;
      p) port=$OPTARG ;;
      i) identity_file=$OPTARG ;;
      \?) echo "Invalid option -$OPTARG" >&2 ; print_usage ; exit 1 ;;
      :) echo "Option -$OPTARG requires an argument" >&2 ; print_usage ; exit 1 ;;
    esac
  done

  # make sure required arguments are provided
  if [ -z "$user" ] || [ -z "$host_file" ] || [ -z "$identity_file" ]; then
    echo "Missing required argument(s)." >&2 ; print_usage ; exit 1
  fi

  # set default port to 22 if not provided
  [ -z "$port" ] && port=22

  # make sure identity file exists
  if [ ! -f "$identity_file" ]; then
    echo "Identity file not found: $identity_file" >&2 ; exit 1
  fi

  # make sure host file exists
  if [ ! -f "$host_file" ]; then
    echo "Host file not found: $host_file" >&2 ; exit 1
  fi
}

# distribute public key to a remote host
function distribute_key {
  host=$1

  echo "Distributing SSH public key to $host..."

  # use ssh-copy-id to copy public key to remote host
  ssh-copy-id -i "$identity_file" -p "$port" "$user@$host" > /dev/null 2>&1

  # check if ssh-copy-id command was successful
  if [ $? -eq 0 ]; then
    echo "SSH public key distributed successfully to $host."
  else
    echo "Failed to distribute SSH public key to $host." >&2
  fi
}

# main script execution
function main {
  check_ssh_client
  check_ssh_agent
  handle_arguments "$@"

  # read list of hosts and store them in an array
  hosts=($(awk '{ print $1 }' "$host_file"))

  # distribute public key to each host
  for host in "${hosts[@]}"; do
    distribute_key "$host"
  done
}

# execute main function with script arguments
main "$@"
