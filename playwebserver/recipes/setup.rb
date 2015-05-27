

Chef::Log.info("=================================== playwebserver::setup - START ==================================== \n ")
["#{node['playwebserver']['ubuntuhome']}#{node['createdir']['download_dir']}", "#{node['playwebserver']['ubuntuhome']}#{node['createdir']['deployment_dir']}"].each do |path|
  directory path do
    mode #{node['createdir']['mode']}
    owner #{node['createdir']['owner']}
    group #{node['createdir']['group']}
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


cript "install_activator" do
  interpreter "bash"
  user "root"
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

execute 'pull out build' do
  command "aws s3 cp s3://rexterdownload/tools/typesafe-activator-1.3.2.zip /home/ubuntu/download/"
  user 'root'
end

script "install_activator" do
  interpreter "bash"
  user "root"
  cwd "/tmp"
  code <<-EOH
    #insert bash script
    cd /home/ubuntu/download && unzip typesafe-activator-1.3.2.zip
    mv activator-1.3.2 /opt/activator
    echo "export PATH=$PATH:/opt/activator" >> /home/ubuntu/.bashrc
    source /home/ubuntu/.bashrc
    activator
  EOH
end



Chef::Log.info("=================================== playwebserver::setup - END   ==================================== \n ")

