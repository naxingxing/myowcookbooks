

Chef::Log.info("=================================== playwebserver::setup - START ==================================== \n ")
["#{node['playwebserver']['ubuntuhome']}#{node['createdir']['download_dir']}", "#{node['playwebserver']['ubuntuhome']}#{node['createdir']['deployment_dir']}"].each do |path|
  directory path do
    mode #{node['createdir]['mode']}
    owner #{node['createdir]['owner']}
    group #{node['createdir]['group']}
    recursive true
    action :create
  end
end

Chef::Log.debug("========================== DEBUG installing apache2 ===========================")

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

execute 'imtesting' do
  command "touch /home/ubuntu/wwwww"
  action :run
end

=begin

this is a comment line

=end





Chef::Log.info("=================================== playwebserver::setup - END   ==================================== \n ")

