#!/bin/bash

cp /home/ubuntu/download/hxcbsite/target/universal/hxcbsite-1.0-SNAPSHOT.zip /home/ubuntu/deployment/
cd /home/ubuntu/deployment && unzip hxcbsite-1.0-SNAPSHOT.zip

nohup ./hxcbsite-1.0-SNAPSHOT/bin/hxcbsite &






