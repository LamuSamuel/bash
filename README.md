**CLI** - A way to interact with computer programme with commands.

On a linux Operating system , the program to run and  integrate these commands is called as *shell* .

*shell script* is a text file with linux commands  

**BASH - Borne again shell** is most common implementation of shell programme  for linux systems  

Bash has more advanced features compared to some of the simpler flavours of shell.   

**Terminal**  is basically a graphical window to type out your commands or run scripts that shell program or bash will execute .

To switch to bash terminal in the Mac , which is already installed but it is not the default one , so in order to switch to bash just type bash in the terminal.

### Commands :

Imaging you are a junior developer and debugging an issue on a prod server , first thing is to go through the Application logs.


`uname` : prints basic info about the operating system name and system hardware.
 
- `pwd` : To exactly know in which directory are we in 

- `cd` : To change current directory (imagine you are in the root directory and need to check logs which are under /var/log/appliaciton) so , **cd /var/log/application**.

-  `ls` : To see which files are under the specific directory , we use ls command 

- `ls-l` : To see the long listing format we use this command .
    
   - -r---|---|--- (first char which is - means file , if its d then its a directory.rest of it has been seperated by 3 pipes ,each for users , groups and others)

   - r - readable(4) , w - writeable(2), x - executable(1 )

   - To change a file permission in linx we have a command called  `chmod 444 db.conf`  this command gives only read permission for 3 users. if you want to give all permissions then `chmod 777 db.conf`

    
- `cat` : Displays file content. (cat errors.log)

- `cat` : Concatenate two file .(cat text1.txt text2.txt > merged.txt)

"|" - pipe helps to pass output of one command as input of another command and it helps to chain multiple commands.

`grep` : stands for global regular expression print . Used to search for text patterns in files or output.Filters and displays lines that match a specific string or pattern.

cat errors.txt | grep "Database" 

">" - redirection of data into another file.  

cat errors.txt | grep Database > errors_with_database.txt  , ls , cat errors_with_database.txt.

`cp[source][destination]` : command to copy files and directories across the file systems. Source - what to copy , Destination - Where to copy.

`wc` : stands for word count , to count number of lines , words , characters in a file.

    cat errors.txt | grep "Connection Refused" | wc -l(lines) , -w (words) , -c(bytes) , -m(characters),-L (Longest Line Length).

`find[starting_path][option][expression]` : used to search for files and directories in a directory hierarchy. starting_path : where to search , option  : search  by name , file type ,filesize or permission.

  - find . -name "*.py" (searches for the py files in the current directory)

  - find / -name "*.conf"(searches for the py files in the entire system, say this resulted in `db.conf`)

  - find / -name "*.conf*"(The second asterisk (*) matches any sequence of characters after .conf and this resulted in `db.conf.backup`)

`diff` : compares two files and shows different between them.

    diff db.conf db.conf.backup 

`curl` : Stands for client URL , used to transfer data from or to a server using HTTPS protocols, helps in debugging network issues

     curl https://google.com

    curl -I https://google.com " -I helps only in fetching the headers of a webpage"

`vim` : Screen based text editor program , it has insert mode  used for typing and editing  ,Normal mode which is default for navigation ,Command mode for commands like save quit and search.

    vim db.conf  (to insert press i , then edit and save. to exit press `esc` : wq to quit)

## Debugging 

**Manual Log Analysis with commands**
 
Filtering the logs based on the criticality 

    grep "ERROR" application.log 
  
    grep "FATAL" application.log
  
    grep "CRITICAL" application.log 
    
    grep -c "ERROR" application.log    - give the total count. 

finding Recent changes in log (less tha one day):
  
  `find . -name "*.log"   -mtime -1`    (This command finds the file that ends with .log in the current directory less than 1 day of modification time(-mtime))

Imagine as a devops engineer , you'll have to perform the above task to check the recent modified files is always time consuming. so inorder to overcome this we can build a shell  script. 

Place all the commands in one shell script and run the script everyday .

  ` 

    find . -name "*.log"   -mtime -1

    grep "ERROR" application.log

    grep "FATAL" application.log

    grep "CRITICAL" application.log

    grep "ERROR" system.log

    grep "FATAL" system.log

    grep "CRITICAL" system  .log
 `
   
# creating First shell script 

`touch` this commands helps to create a new file in the present directory 
    
    touch  analyse-logs.sh

why sh extension ? - just a visual clue to help script files  and syntax highlighting . 

files ending with .sh could be of bash script ,  zshell script   or shell script , but how dies interpreter know  which shell program the script is when it executes ?

 
`#!` is the *shebang* also called as hashbang is a character sequence at a very top of script that tells the operator system which interpreter to use to run the file.

for bash it is `#!/bin/bash` 

and for POSIX shell scripts it is `#!/bin/sh`

*Formatting and Readability Improvements*

`echo` is a built in command helps in printing text or variables to terminal 
 
  echo -e "\n this \n will be interpreted by echo command to print in a new line , by adding -e flag to the command   "

Variables can store the repeated values and reference them when ever we need them. 

variables can be accessed by using $<variable name> after they are assigned.  

    app_file = application.logs
    $app_file

Writing to files 
`>` This character overwrites everytime the command is executed
 
`>>`  This character appends every new output to the existing file content.

Conditionals : 
  
  `if` starts the conditionals
  `then` runs if condition is true
  `else` runs if the condition is false
  `elif` else if for multiple condition 
  `fi` close the if block like and end statement. 
    