## Find all ocurrences of et

# Using only grep
grep et lorem/at.txt

# Using the pipe | operator
cat lorem/at.txt | grep et

## Count all the ocurrences of et in at.txt

##### All ocurrences of et, including inside a word
cat lorem/at.txt | grep et -o | wc -w
# cat lorem/at.txt : return the content of at.txt
# grep et : find the ocurrences of et
# -o : The -o flag (or option) returns only the MATCHING part of the string
# wc -w : counts all the words on a a given text (Options: -l (lines), -w (words))

grep -o et lorem/at.txt | wc -w

##### All ocurrences of the WORD et (Full match), that is, does not count et inside another word
grep -wo et lorem/at.txt | wc -w
# -w flag : only matches FULL words

##### Getting all words CASE insensitively
grep -wio et lorem/at.txt | wc -w
# -i flag : Searches case insensitively, both upper case and lower case

## Count all the ocurrences of et in all of the files in lorem
grep -ro et lorem/ | wc -l

grep -roh et lorem/ | wc -w
# -h flag : Does not return file headers (file names)

# Using cat to read multiple files
cat lorem/* | grep -o et | wc -l

## Get active user:
whoami

# Printing env variable USER
echo $USER

## Substituting et for ET
sed 's/et/ET/gi' lorem/at.txt

# Replacing the file
sed -i "" 's/et/ET/gi' lorem/at.txt
# -i flag : inplace