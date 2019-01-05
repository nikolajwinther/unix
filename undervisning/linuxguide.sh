#!/bin/bash

################################
## UNIX text processing guide ##
################################

# This is a short guide to the most common programmes in UNIX with a few usage examples next to each.
# For more information check man-pages or the great Internet.

###################
## File handling ##
###################

pwd
# pwd: what directory am I in

man
# man: manual for programmes. Example:
man pwd  # opens manual for the program "pwd"

ls
# ls: list - shows files and directories awailable. Examples:
ls -l    # long format
ls -lrt  # long format, sorted with latest revised files lowest
ls -1R   # short format with one listing per line, recursive, shows content from all subdirectories

cd
# cd: change directory. Examples:
cd ..      # go one directory up
cd -       # go back to the last directory
cd         # go to homedir
cd archive # go to archive directory

mv
# mv: move a file. Examples:
mv numfile1 numfile2           # renames file1 to file2
mv numfile1 numfile2 archive/  # moves file1 and file2 to archive directory
mv numfile* archive            # moves all files starting with numfile to archive directory

cp
# cp: copy a file Examples:
cp numfile1 numfile2           # creates a copy of numfile1 to numfile2
cp -p numfile1 numfile2        # creates a copy of numfile1 to numfile2, with timestamp, owner signature etc intact
cp -r /home/niw/undervisning . # creates a copy of the directory undervisning complete with subdirectories in current position

rm
# rm: remove a file. Examples:
rm numfile1          # removes file named numfile1
rm numfile1 numfile2 # removes files named numfile1 and numfile2
rm numfile*          # removes all files beginning with numfile
rm -fr archive/      # removes the archive directory, and all its content and subdirectories without asking any security questions

chmod
# chmod: change a file's mod bits. Controls are handles in binary code. read: 4, write: 2, executable: 1. Examples:
chmod 755 forLoop.sh  # makes the file executable and readable for all groups, and writable for owner: -rwxr-xr-x
chmod 666 numfile1    # makes the file writable and readable for all groups: -rw-rw-rw-
chmod 400 sysfile     # makes the file readable only for owner: -r--------

mkdir
# mkdir: creates a directory. Example:
mkdir archive  # Creates a sub directory named archive
mkdir ../test  # Creates a sister directory named test

rmdir
# rmdir: removes directory if it is empty. Example:
rmdir archive

touch
# touch: creates an empty file, or updates timestamp on an existing file. Example:
touch numfile1

echo
# echo: prints whatever follows to standard output
echo 'Hello world!' # prints: Hello world!
echo {1..5}         # prints: 1 2 3 4 5
echo {a..g}         # prints: a b c d e f g

tee
# tee: read from standard input and write to standard output and files
echo hello | tee hellofile           # creates (or overwrites) a file named hellofile and puts the string "hello" into it
echo hello again | tee -a hellofile  # appends the string "hello" into a file named hellofile

cat
# cat: concatenate. Show content of a file. Combine several files into one. Examples:
cat numfile1           # show content of numfile1
cat -n numfile1        # show content of numfile1, with line numbers
cat numfile1 numfile2  # combines numfile1 and numfile2

tac
#tac: reverse cat. Shows content in reverse order. Example:
tac inputfile  #shows content of inputfile with last line first and so on.

less
# less: shows content of input. Examples:
less numfile1

head
# head: shows the first lines of input. Examples:
head numfile1       # shows first 10 lines of numfile1
head -20 numfile1   # shows first 20 lines of numfile1
head -c 10 numfile1 # shows first 10 bytes of numfile1

tail
# tail: shows the last lines of input. Examples:
tail numfile1       # shows last 10 lines of numfile1
tail -20 numfile1   # shows last 20 lines of numfile1
tail -c 10 numfile1 # shows last 10 bytes of numfile1

>
>>
# diverts content into a file. Example:
cat numfile1 numfile2 >numfile3 # combines numfile1 and numfile2 and diverts the result into numfile3
cat numfiles4 >>numfile3        # adds content of numfile4 to numfile3
cat numfile19 2>/dev/null       # prints numfile19. If that doesn't exist it then diverts the error message (2) to nowhere (/dev/null). 

|
# pipe. Allows you to continue to work with your input. Example:
cat numfile1 | head   # first opens the file numfile1, then shows the first 10 lines

semarc
# semarc: converts iso2709 files to marc line format files. Example:
semarc 870970.1000del.iso | less
semarc 870970.1000del.iso >870970.1000del.dm2
zcat 201708130511.aquaIncr.20170812.gz | semarc | less

txt2marc
# txt2marc: converts  marc line format files to iso2709 files. Example:
txt2marc 870970.1000del.dm2 870970.1000del.iso

locate
# locate: list files containing that name

#######################
## Text manipulation ##
#######################

grep
# grep: print lines matching a pattern. Examples:
grep "text string" filename    # lists all the lines that contains the string "text string" from the file filename
grep "text string" filename*   # lists all the lines that contains the string "text string" from all the files that
                               # starts with filename, and lists from which file the string is present in.
cat filename* | grep "text string"  # combines all files starting with filename and then lists all the lines that
                                    # contains the string "text string"
grep -ic "SMM" filename         # counts the lines that contains the string "SMM" (case insensitive) in the file filename

zgrep
# zgrep: like grep, but for gzipped files (files with suffix gz)

wc
# wc: wordcount. counts bytes, words and lines. Examples:
wc -l numfile1  #count number of lines in the file numfile1
wc -l numfile*  #count number of lines in all the files beginning with numfile

sed
# sed: stream editor. Can search and replace in a file. Examples:
cat inputfile | sed 's/Margrethe/Frederik/g'  # replaces all instances of Margrethe with Frederik
sed -i 's/^/Punkt: /g' inputfile              # Insert "Punkt: " into the beginning of every line in inputfile
seq 100 |sed -n '1~9p'                        # Prints every ninth line, beginning with the second
seq 100 | sed -n '5,10p'                      # Prints line 5-10
echo 23645564 | sed 's/\([0-9]\{1\}\)\([0-9]\{3\}\)\([0-9]\{3\}\)\(.*\)/\"\1 \2 \3 \4\"/g'  # expands a faust number
sed -e :a -e '$!N;s/\n/\t/;ta' -e 'P;D'        # replaces newline with a tab

tr
# tr: translate characters. Examples:
cat inputfile | tr '\t' '\n'     # replaces all instances of tabulator with newline from an inputfile
echo "2 364 556 4" | tr -d " "   # removed spaces

rev
# rev: reverses input. With rev "123" becomes "321". Example:
echo 123 | rev

sort
# sort: sorts input alphabetically or numerically. Examples:
cat numfile | sort -n  # sorts numfile in numeric order
cat numfile | sort -u  # shows only lines once, even if they appear many times in the first place

uniq
# uniq: always in combination with sort. Shows unique instances of input. Examples:
cat numfile | sort | uniq               # prints a file, sorts it, and only shows one of each different line
cat numfile | sort | uniq -c | sort -rn # prints a file, sorts it, and show how many times each diffent line appears in reverse numeric order
cat numfile | sort | uniq -d            # prints a file, sorts it, and only shows lines that appears more than once
cat numfile | sort | uniq -u            # prints a file, sorts it, and only shows lines that appears once

cut
# cut: remove sections of each line of a file. Examples:
cat inputfile | cut -f3,4         # prints a file, and displays coloumn 3 and 4, separated by tabulator
cat inputfile | cut -d "," -f3-5  # prints a file, and displays coloumn 3, 4 and 5, separated by comma
cat inputfile | cut -c 1-8        # prints a file, and displays the first 8 characters in each line

paste
# paste: combines two or more files next to each other. Examples:
paste inputfile1 inputfile2

seq
# seq: print a sequence of numbers. Examples:
seq 10           # prints numbers 1 through 10 with newline as separator
seq -w 100       # prints numbers 001 through 100 with newline as separator
seq -w 7 1 12    # prints number from 07 to 12 with newline as separator
seq -s , 10      # prints 1,2,3,4,5,6,7,8,9,10
seq -s , 0 7 70  # prints 0,7,14,21,28,35,42,49,56,63,70

date
# prints the current date. Examples:
date +%Y%m%d%m                    # prints date in this format: 2017081108
date +%Y-%m-%d --date="2 days ago"  # prints the date for the day before yesterday in this format: 2017-08-09


expr
# calculator
expr 247 - 1       # prints: 246
echo $((10 * 10))  # prints: 100
echo $((10 / 5 ))  # prints: 2
echo $((10 / 4 ))  # prints: 2
echo $((10 % 5  ))
echo $(( ))
echo $(( ))


wget
# accesses internet and retrieves data, usually from http-pages. Examples:
wget -O fulltext1342.txt "http://www.gutenberg.org/files/1342/1342-0.txt"  # retrieves data from the mentiones webpage and stores it in the file fulltext1342.txt

sleep
# pauses the proces for how log time you state
sleep 1    # sleeps 1 second
sleep 1m   # sleeps 1 minute
sleep 0.1  # sleeps 0.1 second

#####################
## System handling ##
#####################

sudo
# superuser do. Allows you to perform actions as root without logging in as root

su
# switch user. Change to another user. Example:
sudo su - niw  # change to user "niw" with his settings

du -sh *
#disk usage , summarized and human readable

top
# shows applications running

scp
#copy between servers, example:
guesstimate:/home/niw/datain/marcposter/basismigration*iso .
# copies all files from the server named guesstimate from the current directory
# that begins with basismigration and ends with iso to the current directory

ftp
# Accesses an ftp-server. Examples:
ftp ftp.dbc.dk #accesses DBC's ftp server
cat ftp-commands | ftp ftp.dbc.dk
# accesses DBC's ftp server and executes the commands listed in the document ftp-commands

sftp
# like ftp, but in a secure environment

#########################
## Regular expressions ##
#########################

^     # beginning of line
$     # end of line
\n    # newline
\t    # tabulator
.     # any character
[a-z] # all small characters

# for more, see: http://www.regular-expressions.info/reference.html

#############################
## Scripting and variables ##
#############################

echo $USER               # prints the user you are using

dato=$(date +%Y%m%d%m)   # Creates a variable named date containing the string: 2017081108 (or whatever date you do it for)
echo $dato               # Prints the content of the variable $dato

id="1342"                                                                     # Creates a variable named id containing the string: 1342
wget -O fulltext${id}.txt "http://www.gutenberg.org/files/${id}/${id}-0.txt"  # retrieves data from the mentiones webpage and stores it in the file fulltext1342.txt



###########
## Loops ##
###########

#for loop
for i in $(seq 10); do echo Kapitel $i; done
# prints:
Kapitel 1
Kapitel 2
Kapitel 3
Kapitel 4
Kapitel 5
Kapitel 6
Kapitel 7
Kapitel 8
Kapitel 9
Kapitel 10

for i in 1 2 3; do echo Kapitel $i; for k in a b c; do echo Underkapitel $k; done; done
# Loop in a loop. Prints:
Kapitel 1
Underkapitel a
Underkapitel b
Underkapitel c
Kapitel 2
Underkapitel a
Underkapitel b
Underkapitel c
Kapitel 3
Underkapitel a
Underkapitel b
Underkapitel c


for id in $(echo 4561 14561 24561 34561 44561 54563); do wget -O fulltext${id}.txt "http://www.gutenberg.org/files/${id}/${id}-0.txt"; done
# Retrives data from 5 webpages with the mentioned numbers and stores them in 5  files with corresponding numbers

#if else loop
if [ $USER == "niw" ]; then echo "Hej niw";else echo "Du er ikke niw";fi
# checks what user you are and prints different messages accordlingly

#while loop
count=1; while [ $count -lt 100 ]; do if [ $count -eq 20 ]; then echo $count and no more; break; fi; echo $count; count=$(expr $count + 1); done
# counts only to 20 even though input would count to 100


############
## alias  ##
############

# alias are your own personal shortcuts. They are set in the file .bashrc in your home directory. I have following aliases on devel8:

dirgoto() {
    cd /home/niw/conversion-flows/$1/$2
}
alias goto=dirgoto

functionsinglerecord() {
    tr \\035 \\n | grep "$1" | tr \\n \\035 | semarc
}
alias singlerecord=functionsinglerecord

dirgotoindexdev() {
    cd /home/niw/rawrepo-basisbranch/solr-indexer/index_development/$1
}
alias index-development=dirgotoindexdev

alias E='exit'
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias lr='ls -lrt'
alias addi='addi_show'
alias chis='history | cut -c 8-999'
alias qmig3='cd /home/niw/datawell-convert/trunk/js/'
alias toline='sed "s/></>\n</g"'
alias faustblank="sed -rn 's/([0-9])([0-9]{3})([0-9]{3})([0-9])/\1 \2 \3 \4/p'"
alias c-shell='/home/niw/datawell-convert/trunk/bin/datawell-convert-jscommonshell'
alias j-shell='/home/niw/datawell-convert/trunk/bin/datawell-convert-jsshell'
alias agrep='ack-grep'
alias removeParanthesis="sed 's/[()]//g'"
alias aqua-corepo-extract='corepo-extract -d corepo_readonly:EiXalahCh7@shard0.db.corepo.aqua.prod.dbc.dk:5432/root'
alias cisterne-corepo-extract='corepo-extract -d corepo_readonly:me3Tai1lei@shard0.db.corepo.cisterne.prod.dbc.dk:5432/root'
alias qindexscripts='cd /home/niw/rawrepo-basisbranch/solr-indexer/src/main/resources'
