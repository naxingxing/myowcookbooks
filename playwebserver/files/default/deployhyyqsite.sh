#!/bin/bash




mkdir /home/ubuntu/start

cd /home/ubuntu/download && git clone https://github.com/naxingxing/hyyqsite.git
cd hyyqsite && activator dist
cp target/universal/hyyqsite-1.0-SNAPSHOT.zip /home/ubuntu/deployment/
cd /home/ubuntu/deployment && unzip hyyqsite-1.0-SNAPSHOT.zip
nohup ./hyyqsite-1.0-SNAPSHOT/bin/hyyqsite &


mkdir /home/ubuntu/end
