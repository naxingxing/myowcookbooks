#!/bin/bash





cd /home/ubuntu/download/hyyqsite
mkdir test_st && sudo activator dist && mkdir test_ed
cp target/universal/hyyqsite-1.0-SNAPSHOT.zip /home/ubuntu/deployment/;
cd /home/ubuntu/deployment && unzip hyyqsite-1.0-SNAPSHOT.zip;



nohup ./hyyqsite-1.0-SNAPSHOT/bin/hyyqsite &






