# rsync process construction 

## rsync shell scripts 

1. status zero: date, time and process's name; 
2. `rsync` command;
3. status two: date, time and process's name

### structure of monitor & alarm

First, we need to get the output of `rsync` command as 'output'

For example:
```{shell}
$date=date +%Y-%m-%d 
$status="syncing"
echo $data$+$status >> /dir/status.txt
for (i in 1 = 1; i < 5; i ++)
    do
        rsync -avz -delete /dir/ /dir/
        if (echo "$?" ==1)
        then
            break
        fi
        echo "done :-)"
        output=$(echo "Error while running rsync")
    done
$date= data+%Y-%m-%d        
echo $date+$output >> /dir/status.txt
```

## control scripts 

control **all** the rsync bash 

## status txt 

record all the 'status zero' & 'status one'

## status HTML 

show status of each mirror
