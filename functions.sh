#!/bin/sh
# set variables 
declare -r TRUE=0
declare -r FALSE=1
declare -r PASSWD_FILE=/etc/passwd

# ------------------------------------------------------------------------------
# Purpose: Converts a string to lower case
# Arguments:
#   $1 -> String to convert to lower case
# ------------------------------------------------------------------------------
function to_lower() 
{
    local str="$@"
    local output     
    output=$(tr '[A-Z]' '[a-z]'<<<"${str}")
    echo $output
}
# ------------------------------------------------------------------------------
# Purpose: Display an error message and die
# Arguments:
#   $1 -> Message
#   $2 -> Exit status (optional)
# ------------------------------------------------------------------------------
function die() 
{
    local m="$1"	# message
    local e=${2-1}	# default exit status 1
    echo "$m" 
    exit $e
}
# ------------------------------------------------------------------------------
# Purpose: Return true if script is executed by the root user
# Arguments: none
# Return: True or False
# ------------------------------------------------------------------------------
function is_root() 
{
   [ $(id -u) -eq 0 ] && return $TRUE || return $FALSE
}

# ------------------------------------------------------------------------------
# Purpose: Return true $user exits in /etc/passwd
# Arguments: 
#   $1 (username) -> Username to check in /etc/passwd
# Return: True or False
# ------------------------------------------------------------------------------
function is_user_exits() 
{
    local u="$1"
    grep -q "^${u}" $PASSWD_FILE && return $TRUE || return $FALSE
}

# ------------------------------------------------------------------------------
# Purpose: Checks if command exists and if it does not, runs brew install
# Arguments:
#   $1 -> command
#   $2 -> install script
# ------------------------------------------------------------------------------
function install () {
  export installed=`which $1`
  if [ "$installed" == "" ]; then
    set -x
    eval $2
    { set +x; } 2> /dev/null;
  else
    echo "installed $1"
  fi
}
