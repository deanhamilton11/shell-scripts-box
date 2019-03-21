#!/bin/bash
# nicenumber--Given a number, shows it in comma-separated form. Expects DD
#   (decimal point delimiter) and TD (thousands delimiter) to be instantiated.
#   Instantiates nicenum or, if a second arg is specified, the output is
#   echoed to stdout.

nicenumber()
{
  # Note that we assume that '.' is the decimal seperator in the INPUT value
  #   to this script. The decimal separator in the output value is '.' unless
  #   specified by the user with the -d flag.

  integer=$() # Left of the decimal
  decimal=$() # Right of the decimal
}

# Begin Main Script
while getopts "d:t:" opt; do
  case $opt in
    d ) DD="$OPTARG" ;;
    t ) TD="$OPTARG" ;;
  esac
done
shift $(($OPTIND - 1))

# Input validation
if [ $# -eq 0 ] ; then
  echo "Usage: $(basename $0) [-d c] [-t c] number"
  echo "  -d specifies the decimal point delimiter"
  echo "  -t specifies the thousands delimiter"
  exit 0
fi

nicenumber $1 1 # Second arg forces nicenumber to 'echo' output.

exit 0
