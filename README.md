# Classfy

Bash script for organising files by financial (or fiscal) year. A financial year starts on 1 July and ends on 30 June the following year and are named after the year in which it ends. For example, the script names the financial year from 1 July 2015 to 30 June 2016 "2016FY".

The script assumes the file names are in the format `<name><date>.<extension>`, where date is in the form `ddMMMyyyy` or `MMMyyyy`. 

## Usage

```bash
classfy.sh [DIRECTORY]
```

`[DIRECTORY]` is an optional parameter. The script will organise the files in this directory when specified. Otherwise, it will organise files in the current working directory.