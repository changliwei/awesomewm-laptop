#!/bin/bash
cd $XDG_CONFIG_HOME/awesome/themes/
for dir in `find ./ -type d | cut -d/ -f2 | sort | uniq`; do  
    cp -i $XDG_CONFIG_HOME/awesome/custom/default_script $dir/script.sh  
    sed -i "s/themes\/default_script/themes\/${dir}/g" $dir/script.sh  
#   echo $dir;
done
cp $XDG_CONFIG_HOME/awesome/custom/default_script $XDG_CONFIG_HOME/awesome/global_script.sh