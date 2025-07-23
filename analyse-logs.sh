#!/bin/bash
directory=/Users/lamusamuel/Documents/smoke/summerbreak/bash/bash/logs
Report_File=/Users/lamusamuel/Documents/smoke/summerbreak/bash/bash/logs/report.txt
Error_patterns=("ERROR" "FATAL" "CRITICAL")  # array declaration

echo "Analysing Log Files
 ========================== " >> "Report_File"
echo  "\n List of files Update in Last 24 hours"  >> "Report_File"

files=$(find $directory -name "*.log")
echo $files >> "Report_File"

for log_files in $files; do # for loops
  echo "\n" >> "Report_File"
  echo "================Debugging=====================" >> "Report_File"
  echo "$log_files" >> "Report_File"


  #echo -e "\nSearching ${Error_patterns[0]} in application log files"
  #grep "${Error_patterns[0]}" $log_files  # usuage of arrays
  #echo -e "\nSearching ${Error_patterns[1]} in application log files"
  #grep "${Error_patterns[1]}" $log_files
  #echo -e "\nSearching ${Error_patterns[2]} in application log files"
  #grep "${Error_patterns[2]}" $log_files
  #echo -e "\nSearching ${Error_patterns[0]} in system log files"
  #grep "${Error_patterns[0]}" $log_files
  #echo -e "\nSearching ${Error_patterns[1]} in system log files"
  #grep "${Error_patterns[1]}" $log_files
  #echo -e "\nSearching ${Error_patterns[2]} in system log files"
  #grep "${Error_patterns[2]}" $log_files
  #echo -e "\nDone Finding Logs"

  # to overcome the above multiple statements we can introduce one more for loop.
  for pattern in "${Error_patterns[@]}"; do   # syntax to loop through each element of array and extract them is "${array_name}[@]";
  echo  "\n =========================$pattern======================" >> "Report_File"
     echo "\nSearching $pattern in application log files" >> "Report_File"
            grep $pattern $log_files >> "Report_File"
            count=$(grep -c "$pattern" "$log_files")
            if [ "$count" -gt 5 ]; then
              echo "\n Immediate action required, Too many($count) $pattern errors in $log_files$"
            fi
            done
echo "Completed debugging the $log_files , the result has been saved in to $Report_File"
    done

