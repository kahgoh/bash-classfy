#!/bin/bash

# Names of months for which the financial year is the following year.
NEXT_YEAR_MONTHS=("JUL" "AUG" "SEP" "OCT" "NOV" "DEC")

# All the months in a year.
MONTHS=("JAN" "FEB" "MAR" "APR" "MAY" "JUN" "${NEXT_YEAR_MONTHS[@]}")

filesDirectory='.'
if ((${#} > 0)); then
  filesDirectory=${1}
fi

function testInArray {
  array="$1[@]"
  value="$2"
  expected=("${!array}")

  for candidate in "${expected[@]}"
  do
    if [[ "$value" == "${candidate}" ]]
    then
      return 0
    fi
  done

  return 1
}

for file in "${filesDirectory}"/*; do
  # The month and year are at the end of the file name, in the form MMMyyyy.
  filename=$(basename "${file}")
  name=${filename%.*}
  length=${#name}

  year=${name:${length}-4:4}
  month=${name:${length}-7:3}

  # Validate the year and month. Year is always a a 4 digit number and month
  # must be in MONTHS array.
  testInArray MONTHS "${month}"
  isMonth=$?
  if [[ "${year}" =~ ^[0-9]{4}$ && isMonth -eq 0 ]]; then

    testInArray NEXT_YEAR_MONTH "${month}"
    isNextYearMonth=$?
    if [[ isNextYearMonth -gt 0 ]]; then
      year=$((${year}+1))
    fi

    destination=${filesDirectory}/${year}FY
    if [[ ! ( -d $destination) ]]; then
      mkdir ${destination}
    fi
    mv ${file} ${destination}
  else
    echo Skipping file ${file}
  fi
done
