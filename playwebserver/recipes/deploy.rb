Chef::Log.info("=================================== playwebserver::deploy - START ==================================== \n ")




Chef::Log.info("=================================== playwebserver::deploy - RUNNING ==================================== \n ")


node[:opsworks][:applications].each do |app|
  log "\n\n\n#{app[:name]}\n#{app[:application_type]}\n#{app[:slug_name]}\n\n\n"
end

unless node[:deploy]['hyyqsite'].nil?
  log "\n\nRexter testing:\n\n#{node[:deploy]['hyyqsite'][:scm][:scm_type]} - #{node[:deploy]['hyyqsite'][:scm][:repository]}\n\n"
end

cookbook_file "download_dist" do
  source "deployhyyq.sh"
  mode 0755
  user 'ubuntu'
end

Chef::Log.info("==================================== playwebserver::deploy - END ===================================== \n ")