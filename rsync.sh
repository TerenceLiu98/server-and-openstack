#-----------------------------#
# This is a .sh for rsync doc #
#-----------------------------#

#----- CRAN -----#
& rsync -rtlzv --delete cran.r-project.org::CRAN /mnt/mirrors/CRAN/ &

# createrepo /home/mirror/epel/7/SRPMS/
#----- CTAN -----# 
& rsync -rtlzv --delete rsync://mirrors.tuna.tsinghua.edu.cn/CTAN/ 
/mnt/mirrors/CTAN/ & 

#----- pypi -----#
& bandersnatch mirrori &

when 
echo "bboysoul done"
