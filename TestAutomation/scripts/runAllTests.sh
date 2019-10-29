cd $(dirname $0)

#delete all class files, report files and temp files
rm -rf ../testCasesExecutables/*.class
rm -rf ../testReports/testReport.html
rm -rf ../temp/*.txt

#creates an htmlfile formated with a table
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

#compiles all java files in the folder
javac ../testCasesExecutables/*
wait


#loops through all files in testcases
for file in ../testCases/*.txt 
do 
i=0;
filenopath=${file##*/}
filenoext=${filenopath%.*}
	
#reads each file and gets the information and sets it to variables
while read line 
do
arr[$i]=$line
i=$((i+1))
done < $file

#variable declaration	
declare testid=${arr[0]}
declare requirement=${arr[1]}
declare driver=${arr[2]}
declare component=${arr[3]}
declare method=${arr[4]}
declare inputs=${arr[5]}
declare expected=${arr[6]}

if [[ $component == "ColorNameLookup" ]]
then
	cd ../testCasesExecutables
	java xColorNameLookupDriver "$testid" "$requirement" "$driver" "$component" "$method" "$inputs" "$expected" > ../temp/"$filenoext"report.txt &
	fi
	
#if [[ $component == "ColorConverter" ]]
#then
#	cd  ../testCasesExecutables
#	java xHex2RgbDriver "$inputs" "$expected" > ../temp/"$filenoext"report.txt &
#	fi
done
wait


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

for file in ../temp/*
do
i=0;
filenopath=${file##*/}
filenoext=${filenopath%.*}
  while read line 
  do
    printf "<TD>" >> ../testReports/testReport.html
    arr[$i]="$line"
    echo "${arr[$i]}" >> ../testReports/testReport.html
    echo "</TD>" >> ../testReports/testReport.html
    i=$((i+1))
#echo $i
done < $file

declare texpected=${arr[6]}
declare tactual=${arr[7]}

#echo $texpected
#echo $tactual
	 
if [ "$texpected" == "$tactual" ]
 then
	echo "<td bgcolor="green">Pass</td>" >> ../testReports/testReport.html
	 else
	echo "<td bgcolor="red" >Fail</td>" >> ../testReports/testReport.html
	 fi
	
	
echo "</tr>" >> ../testReports/testReport.html
  done

xdg-open ../testReports/testReport.html

