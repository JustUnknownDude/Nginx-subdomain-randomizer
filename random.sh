#!/bin/bash
oldsub=$(cat /sub)
sub=$(echo sub$((RANDOM)))
echo $sub > /sub
sed -i -r "s/$oldsub/$sub/g" /etc/nginx/conf.d/all.conf;
sleep 1s; 
service nginx restart