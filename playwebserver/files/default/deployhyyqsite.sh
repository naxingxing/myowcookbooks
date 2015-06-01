#!/bin/bash





cd /home/ubuntu/download/hyyqsite
mkdir line2_st
activator dist
mkdir line2_ed
wait
mkdir line3_st
cp target/universal/hyyqsite-1.0-SNAPSHOT.zip /home/ubuntu/deployment/
mkdir line3_ed
wait
mkdir line4_st
cd /home/ubuntu/deployment
unzip hyyqsite-1.0-SNAPSHOT.zip 
mkdir line4_ed
wait


nohup ./hyyqsite-1.0-SNAPSHOT/bin/hyyqsite &






