#!/bin/bash



cd /home/ubuntu/download/hxcbsite && activator dist
cp target/universal/hxcbsite-1.0-SNAPSHOT.zip /home/ubuntu/deployment/
cd /home/ubuntu/deployment && unzip hxcbsite-1.0-SNAPSHOT.zip



nohup ./hxcbsite-1.0-SNAPSHOT/bin/hxcbsite &






