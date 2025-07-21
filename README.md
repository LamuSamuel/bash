**CLI** - A way to interact with computer programme with commands.

On a linux Operating system , the program to run and  integrate these commands is called as *shell* .

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



    
 
 


  
      
 



    
    