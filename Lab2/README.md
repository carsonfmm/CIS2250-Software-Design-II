# Lab for Week 1

This is a "markdown" format file describing the materials for this week's lab.  It is written in UTF-8/ASCII so can be read in any code editor, such as `vim`.

Values in back-ticks, such as `vim` above are commands, pieces of code, or names of files.  More on markdown can be found at this link
[https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)

This lab's materials include sample starter code and data files

## Code:

* `readNamesFile.pl` is a perl program - read this to get started programming

## Data
* `top5_2000.txt` contains the top five names from the year 2000 in a raw ASCII file
* `top5_2018.txt` contains the top five names from the year 2018
* `top5_2018_BOM.txt` contains the top five names from the year 2018 in
    a BOM identified file with DOS/Windows style line endings
* `yob2000.txt` contains data on the popularity of all names in the year 2000
* `yob2014.txt` through `yob2018.txt` contain data on the popularity of names
    from all the years from 2014 through 2018

The source data comes from the US census and is available
at
[http://www.ssa.gov/OACT/babynames/limits.html](http://www.ssa.gov/OACT/babynames/limits.html)

A statement on the data included by the US census is as follows:

> National Data on the relative frequency of given names in the population of U.S. births where the individual has a Social Security Number
> 
> (Tabulated based on Social Security records as of March 3, 2019)
> 
> For each year of birth YYYY after 1879, we created a comma-delimited file called yobYYYY.txt.
> Each record in the individual annual files has the format "name,sex,number," where name is 2 to 15 characters, sex is M (male) or F (female) and "number" is the number of occurrences of the name.
> Each file is sorted first on sex and then on number of occurrences in descending order.
> When there is a tie on the number of occurrences, names are listed in alphabetical order.
> This sorting makes it easy to determine a name's rank.
> The first record for each sex has rank 1, the second record for each sex has rank 2, and so forth.
> 
> To safeguard privacy, we restrict our list of names to those with at least 5 occurrences.

# Commands to run

Try running the following commands at the Terminal prompt:
```
    perl readNamesFile.pl top5_2000.txt
    perl readNamesFile.pl top5_2018.txt
    perl readNamesFile.pl top5_2018_BOM.txt
    perl readNamesFile.pl yob2000.txt
    perl readNamesFile.pl yob2018.txt
```

