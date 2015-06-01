#!/bin/bash





cd /home/ubuntu/download/hyyqsite
sudo activator dist && mkdir this_is_test
cp target/universal/hyyqsite-1.0-SNAPSHOT.zip /home/ubuntu/deployment/;
cd /home/ubuntu/deployment && unzip hyyqsite-1.0-SNAPSHOT.zip;



nohup ./hyyqsite-1.0-SNAPSHOT/bin/hyyqsite &






