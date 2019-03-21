#!/bin/bash
# validAlphaNum--Ensures that input consts only of alphabetical
#   and numeric characters

validAlphaNum()
{
  # Validate arg: returns 0 if all upper+lower+digits; 1 otherwise

  # Remove all unacceptable chars.
  validchars="$(echo $1 | sed -e 's/[^[:alnum:]]//g')"

  if [ "$validchars" = "$1" ] ; then
    return 0
  else
    return 1
  fi
}

# Everything below this line must be removed if you want to use
#   this in other scripts
/bin/echo -n "Enter input: "
read input

if ! validAlphaNum "$input"; then
  echo "Please enter only letters and numbers." >&2
  exit 1
else
  echo "Input is valid."
fi

exit 0
