cd $(dirname $0)

##delete all class files, report files and temp files
rm -rf ../testCasesExecutables/*.class
rm -rf ../testReports/testReport.html
rm -rf ../temp/*.txt

##creates an htmlfile formated with a table
now=$(date +"%m-%d-%Y | %H:%M:%S")
echo "<h1>Test Report</h1>" >> ../testReports/testReport.html
echo "Run Time: $now" >> ../testReports/testReport.html
echo "<TABLE BORDER='5' CELLPADDING='4' CELLSPACING='3'>" >> ../testReports/testReport.html
echo "<TR>" >> ../testReports/testReport.html
echo "</TR>" >> ../testReports/testReport.html
echo "<TR>" >> ../testReports/testReport.html
echo "<TH>Test Case ID</TH>" >> ../testReports/testReport.html
echo "<TH>Requirements</TH>" >> ../testReports/testReport.html
echo "<TH>Driver</TH>" >> ../testReports/testReport.html
echo "<TH>Component</TH>" >> ../testReports/testReport.html
echo "<TH>Method</TH>" >> ../testReports/testReport.html
echo "<TH>Inputs</TH>" >> ../testReports/testReport.html
echo "<TH>Expected</TH>" >> ../testReports/testReport.html
echo "<TH>Actual</TH>" >> ../testReports/testReport.html
echo "<TH>Test Passed?</TH>" >> ../testReports/testReport.html
echo "</TR>" >> ../testReports/testReport.html

##compiles all java files in the folder
javac ../testCasesExecutables/*.java
wait


##loops through all files in testcases
for file in ../testCases/*.txt 
do 
i=0;
filenopath=${file##*/}
filenoext=${filenopath%.*}
	
##reads each file and gets the information and sets it to variables
while read line 
do
arr[$i]=$line
i=$((i+1))
done < $file

##variable declaration	
declare testid=${arr[0]}
declare requirement=${arr[1]}
declare driver=${arr[2]}
declare component=${arr[3]}
declare method=${arr[4]}
declare inputs=${arr[5]}
declare expected=${arr[6]}

##chooses what driver need to be used

echo "$testid" >> ../temp/"$filenoext"report.txt
echo "$requirement" >> ../temp/"$filenoext"report.txt
echo "$driver" >> ../temp/"$filenoext"report.txt
echo "$component" >> ../temp/"$filenoext"report.txt
echo "$method" >> ../temp/"$filenoext"report.txt
echo "$inputs" >> ../temp/"$filenoext"report.txt
echo "$expected" >>../temp/"$filenoext"report.txt

cd ../testCasesExecutables/
java $driver "$inputs" >> ../temp/"$filenoext"report.txt &

done
wait

##reads the temp files
for file in ../temp/*.txt
do
i=1;
filenopath=${file##*/}
filenoext=${filenopath%.*}

##adds information to html
  while read line 
  do
    echo "<div class='tooltip'>" >> ../testReports/testReport.html
    echo "<div class='right'>" >> ../testReports/testReport.html
    echo "<TD>" >> ../testReports/testReport.html
    arr[$i]="$line"
    echo "${arr[$i]}" >> ../testReports/testReport.html
    echo "</TD>" >> ../testReports/testReport.html
    echo "</div>" >> ../testReports/testReport.html
    echo "</div>" >> ../testReports/testReport.html
    i=$((i+1))
done < $file

##creates variables for comparison
declare texpected=${arr[7]}
declare tactual=${arr[8]}

#echo $texpected
#echo $tactual

##compares the expected and actual results and adds pass or fail to html	 
if [[ "$texpected" == "$tactual" ]]
 then
	echo "<td bgcolor="green">Pass</td>" >> ../testReports/testReport.html
	 else
	echo "<td bgcolor="red" >Fail</td>" >> ../testReports/testReport.html
	 fi
	

echo "</tr>" >> ../testReports/testReport.html

  done

echo "</TABLE>" >> ../testReports/testReport.html


xdg-open ../testReports/testReport.html
rm -rf ../temp/*.txt
rm -rf ../testCasesExecutables/*.class


#### Helper Code/Testing Code

#test outputs
#echo "-------------------------"  
#echo $testid
#echo $requirement
#echo $driver
#echo $component
#echo $method
#echo $inputs
#echo $expected
#echo ""

#echo $texpected
#echo $tactual

