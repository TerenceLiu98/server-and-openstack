$Push_Source = "cran.r-project.org"
$Push_Target = "/mnt/mirrors/CRAN/"
rsync -rtlzv --delete cran.r-project.org::CRAN /mnt/mirrors/CRAN/

vi /var/log/$Push_Target.log
echo "$(date +%Y-%m-%d_%H:%M:%S) -The Data Directoty:$Push_Source to localhost had Sync Sucess" >>/var/log/$Push_Target.log
