#!/bin/bash



cp target/universal/hyyqsite-1.0-SNAPSHOT.zip /home/ubuntu/deployment/;
cd /home/ubuntu/deployment && unzip hyyqsite-1.0-SNAPSHOT.zip;



nohup ./hyyqsite-1.0-SNAPSHOT/bin/hyyqsite &






