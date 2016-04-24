I created this Zsh script to reorganise some files in a Git repository on my computer. It groups files by "financial year", which runs from 1 July to 30 June the following year. The file names are assumed to be of the following format:

  <name><date>.<extension>

Where data is in the form ddMMMyyyy or MMMyyyy. 

By default, it rearranges the files in the current working directory. An alternate directory may be specified as a parametr to the script.

For simplicity, the financial year is referred to as the year on which it ends (for example, the 2015-2016 financial year is referred to as just 2016 financial year).
