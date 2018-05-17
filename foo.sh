#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

name="Anna"

# $
echo "Hello, $name" # simplest param expansion

# ${}
echo "Hello, ${name}" # same as above, just have {} now
echo ${name}foo # => "Annafoo"
# echo $namefoo #=> error

# ((...)) here is arithmetic evaluation, only for arithmetic expansion to check
# boolean value
for (( i = 0; i < 10; i++ )); do
  echo $i
done

bar=6
if (($bar > 3)); then
  echo "bar is larger than 3"
fi

# $(())
# if not boolean check, have to be $(()), have the $ sign
echo "3 + 4 is $((3 + 4))" # => "3 + 4 is 7"

# $()
# command substitution, $()
echo "I'm in $(pwd)" # => "I'm in xxx", exec'ed in a subshell
(cd $HOME; echo $PWD)
echo $PWD  # => different from above
echo "Today's date is $(date)"

# ${}
# brace expansion
echo {1..3}$PWD
echo _{a,b,d,ef} # => _a _b _d _ef
echo {a..d} # => a b c d
echo 1.{1..9} # => "1.1 1.2 1.3 ... 1.9"

# [[]]
s=""
if [[ -z "$s" ]]; then # use [[]], instead of [] for conditional
  echo "it is empty string"
fi
