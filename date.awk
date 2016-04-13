BEGIN {
  FS="[_.]";

  # These months fall into the financial year that is one greater than the 
  # current year.
  NEXT_YEAR_MONTHS = "JUL AUG SEP OCT NOV DEC";
}

{
  # Extract the month and year from the file name.
  date = $(NF-1);
  dateLength = length(date);
  month = substr(date, dateLength-6, 3);
  year = substr(date, dateLength-3, 4);
  
  financialYear = year;
  if (index(NEXT_YEAR_MONTHS, month) > 0) {
    financialYear = year+1;
  }
 
  directoryName = financialYear "FY" 
  print directoryName;
}
