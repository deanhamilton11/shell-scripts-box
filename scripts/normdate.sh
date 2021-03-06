#!/bin/bash
# normdate--Normalizes month field in date specification to three letters,
#   first letter capitalized. A helper function for Script #7, valid-date.
#   Exits with 0 if no error

monthNumToName()
{
    # Sets the 'month' variable to the appropriate value.
    case $1 in
      1|01 ) month="Jan" ;; 2|02 ) month="Feb"  ;;
      3|03 ) month="Mar" ;; 4|04 ) month="Apr"  ;;
      5|05 ) month="May" ;; 6|06 ) month="Jun"  ;;
      7|07 ) month="Jul" ;; 8|08 ) month="Aug"  ;;
      9|09 ) month="Sep" ;; 10) month="Oct"  ;;
      11) month="Nov" ;; 12) month="Dec"  ;;
      * ) echo "$0: Unknown month value $1" >&2
      exit 1
    esac
    return 0
}

# Everything below this line must be removed if you want to include
#   this in other scripts

# Allow MM/DD/YYYY or MM-DD-YYYY
if [ $# -eq 1 ] ; then
  set -- $(echo $1 | sed 's/[\/\-]/ /g')
fi

# Input validation
if [ $# -ne 3 ] ; then
  echo "$#" >&2
  echo "Usage: $0 month day year" >&2
  echo "Formats are August 3 1962 and 8 3 1962" >&2
  exit 1
fi
if [ $3 -le 99 ] ; then
  echo "$0: expected 4-digit year value." >&2
  exit 1
fi

# Is the month input format a number?
if [ -z $(echo $1|sed 's/[[:digit:]]//g') ]; then
  monthNumToName $1
else
  # Normalize to first 3 letters, first upper- and then lowercase.
  month="$(echo $1 | cut -c1 | tr '[:lower:]' '[:upper:]')"
  month="$month$(echo $1 | cut -c2-3 | tr '[:upper:]' '[:lower:]')"
fi

echo $month $2 $3

exit 0
