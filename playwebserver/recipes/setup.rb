

Chef::Log.info("=================================== playwebserver::setup - START ==================================== \n ")
Chef::Log.info("\n#{node['playwebserver']['ubuntuhome']}#{node['createdir']['download_dir']}\n")
Chef::Log.info("\n#{node['playwebserver']['ubuntuhome']}#{node['createdir']['deployment_dir']}\n")
Chef::Log.info("\n#{node['createdir']['mode']}\n")
Chef::Log.info("\n#{node['createdir']['owner']}\n")
Chef::Log.info("\n#{node['createdir']['group']}\n")

["#{node['playwebserver']['ubuntuhome']}#{node['createdir']['download_dir']}", "#{node['playwebserver']['ubuntuhome']}#{node['createdir']['deployment_dir']}"].each do |path|
  directory path do
    mode "#{node['createdir']['mode']}"
    owner "#{node['createdir']['owner']}"
    group "#{node['createdir']['group']}"
    recursive true
    action :create
  end
end

Chef::Log.debug("========================== DEBUG installing apache2 ===========================")

package "openjdk-7-jre"
package "openjdk-7-jdk"

package 'apache2' do
  action :install
end

package "libapache2-mod-proxy-html"
package "libxml2-dev"
package "libapache2-mod-proxy-html"
package "libxml2-dev"
package "git" 
package "build-essential"
package "zip"


script "install_awscli" do
  interpreter "bash"
  cwd "/tmp"
  code <<-EOH
    #insert bash script
    a2enmod proxy proxy_html proxy_http proxy_ajp
    a2enmod rewrite deflate headers proxy_balancer
    a2enmod headers proxy_balancer proxy_connect
  EOH
end

script "install_awscli" do
  interpreter "bash"
  cwd "/tmp"
  code <<-EOH
    #insert bash script
    curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
    python get-pip.py
    pip install awscli
    pip install --upgrade awscli
  EOH
end

=begin

this is a comment line

=end

if node[:project].nil?
  execute 'pull out build' do
    command "aws s3 cp s3://rexterdownload/tools/typesafe-activator-1.3.2.zip /home/ubuntu/download/"
  end
else
  execute 'pull out build' do
    command "wget -N --directory-prefix=/home/ubuntu/download/ https://s3-ap-southeast-1.amazonaws.com/rexterdownload/tools/typesafe-activator-1.3.2.zip"
  end
end

script "install_sbt" do
  interpreter "bash"
  cwd "/tmp"
  code <<-EOH
    #insert bash script
    echo "deb http://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
    sudo apt-get -y --force-yes update
    sudo apt-get -y --force-yes install sbt
  EOH
end

script "install_activator" do
  interpreter "bash"
  cwd "/tmp"
  code <<-EOH
    #insert bash script
    cd /home/ubuntu/download && unzip typesafe-activator-1.3.2.zip
    mv activator-1.3.2 /opt/activator-1.3.2
    chmod a+x /opt/activator-1.3.2/activator
    echo "export PATH=$PATH:/opt/activator-1.3.2" >> /home/ubuntu/.bashrc
  EOH
end



Chef::Log.info("=================================== playwebserver::setup - END   ==================================== \n ")

