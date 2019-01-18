echo "$(date + %Y-%m%-%d_%H:%M:%S) syncing" >> /rsync_script/status/02.txt

$Push_Source = "rsync://mirrors.tuna.tsinghua.edu.cn/CTAN/"
$Push_Target = "/mnt/mirrors/CTAN/"

rsync -rtlzv --delete rsync://mirrors.tuna.tsinghua.edu.cn/CTAN/
/mnt/mirrors/CTAN/

vi /var/log/$Push_Target.log
echo "$(date +%Y-%m-%d_%H:%M:%S) -The Data Directoty:$Push_Source to localhost had Sync Sucess" >>/var/log/$Push_Target.log

