cd $(dirname $0)

##delete all class files, report files and temp files
rm -rf ../testCasesExecutables/*.class
rm -rf ../testReports/testReport.html
rm -rf ../temp/*.txt

##creates an htmlfile formated with a table
now=$(date +"%m-%d-%Y | %H:%M:%S")
echo "<style> .tooltip {
    display:inline-block;
    position:relative;
    border-bottom:1px dotted #666;
    text-align:left;
}

.tooltip h3 {margin:12px 0;}

.tooltip .right {
    min-width:200px;
    max-width:400px;
    top:50%;
    left:100%;
    margin-left:20px;
    transform:translate(0, -50%);
    padding:0;
    color:#EEEEEE;
    background-color:#444444;
    font-weight:normal;
    font-size:13px;
    border-radius:8px;
    position:absolute;
    z-index:99999999;
    box-sizing:border-box;
    box-shadow:0 1px 8px rgba(0,0,0,0.5);
    visibility:hidden; opacity:0; transition:opacity 0.8s;
}

.tooltip:hover .right {
    visibility:visible; opacity:1;
}

.tooltip .right img {
    width:400px;
    border-radius:8px 8px 0 0;
}
.tooltip .text-content {
    padding:10px 20px;
}

.tooltip .right i {
    position:absolute;
    top:50%;
    right:100%;
    margin-top:-12px;
    width:12px;
    height:24px;
    overflow:hidden;
}
.tooltip .right i::after {
    content:'';
    position:absolute;
    width:12px;
    height:12px;
    left:0;
    top:50%;
    transform:translate(50%,-50%) rotate(-45deg);
    background-color:#444444;
    box-shadow:0 1px 8px rgba(0,0,0,0.5);
}</style>" >> ../testReports/testReport.html
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

