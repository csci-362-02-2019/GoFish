cd $(dirname $0)

rm -rf ../testCasesExecutables/*.class
rm -rf ../testReports/testReport.html
rm -rf ../temp/*.txt

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

javac ../testCasesExecutables/*
wait

for file in ../testCases/*.txt 
do 
i=0;
filenopath=${file##*/}
filenoext=${filenopath%.*}
	
	
while read line 
do
arr[$i]=$line
i=$((i+1))
done < $file
		
declare testid=${arr[0]}
declare requirement=${arr[1]}
declare driver=${arr[2]}
declare component=${arr[3]}
declare method=${arr[4]}
declare inputs=${arr[5]}
declare expected=${arr[6]}

for file in ../temp/*
do
	echo "<tr>" >> ../testReports/testReport.html
  echo -n "<td>" >> ../testReports/testReport.html
  echo -n $testid >> ../testReports/testReport.html
  echo "</td>" >> ../testReports/testReport.html
  echo -n "<td>" >> ../testReports/testReport.html
  echo -n $requirement >> ../testReports/testReport.html
  echo "</td>" >> ../testReports/testReport.html
  echo -n "<td>" >> ../testReports/testReport.html
  echo -n $driver >> ../testReports/testReport.html
  echo "</td>" >> ../testReports/testReport.html
  echo -n "<td>" >> ../testReports/testReport.html
  echo -n $component >> ../testReports/testReport.html
  echo "</td>" >> ../testReports/testReport.html
  echo -n "<td>" >> ../testReports/testReport.html
  echo -n $method >> ../testReports/testReport.html
  echo "</td>" >> ../testReports/testReport.html
  echo -n "<td>" >> ../testReports/testReport.html
  echo -n $inputs >> ../testReports/testReport.html
  echo "</td>" >> ../testReports/testReport.html
  echo -n "<td>" >> ../testReports/testReport.html
  echo -n $expected >> ../testReports/testReport.html
  echo "</td>" >> ../testReports/testReport.html
  

#echo "-------------------------"  
echo $testid
#echo $requirement
#echo $driver
#echo $component
#echo $method
#echo $inputs
#echo $expected
#echo ""
if [[ $component == "ColorNameLookup" ]]
then
	cd ../testCasesExecutables
	java xColorNameLookupDriver "$inputs" "$expected" 
	fi
done
wait
echo -n "<td>" >> ../testReports/testReport.html
  echo -n "<font color="green">" >> ../testReports/testReport.html
	echo -n "pass" >> ../testReports/testReport.html
	echo -n "</font>" >> ../testReports/testReport.html
	echo "</td>" >> ../testReports/testReport.html
	echo "</tr>" >> ../testReports/testReport.html
done

  
