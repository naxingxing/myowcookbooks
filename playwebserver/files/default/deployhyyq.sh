#!/bin/bash



#LINK_OR_DIR='/home/ubuntu/download/hyyqsite'

#if [ -d "$LINK_OR_DIR" ]; then 
#  if [ -L "$LINK_OR_DIR" ]; then
    # It is a symlink!
    # Symbolic link specific commands go here.
#    rm "$LINK_OR_DIR"
#	cd /home/ubuntu/download && git clone https://github.com/naxingxing/hyyqsite.git
#  else
    # It's a directory!
    # Directory command goes here.
#    cd "$LINK_OR_DIR" && git pull
#  fi
#else
#	cd /home/ubuntu/download && git clone https://github.com/naxingxing/hyyqsite.git
#fi


cd /home/ubuntu/download/hyyqsite && activator dist
cp target/universal/hyyqsite-1.0-SNAPSHOT.zip /home/ubuntu/deployment/
cd /home/ubuntu/deployment && unzip hyyqsite-1.0-SNAPSHOT.zip



nohup ./hyyqsite-1.0-SNAPSHOT/bin/hyyqsite &






