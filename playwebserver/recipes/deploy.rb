Chef::Log.info("=================================== playwebserver::deploy - START ==================================== \n ")




Chef::Log.info("=================================== playwebserver::deploy - RUNNING ==================================== \n ")


node[:opsworks][:applications].each do |app|
  log "\n\n\n#{app[:name]}\n#{app[:application_type]}\n#{app[:slug_name]}\n\n\n"
end

log "\n\nRexter testing:\n\n#{node[:deploy]['hyyqsite'][:scm][:scm_type]} - #{node[:deploy]['hyyqsite'][:scm][:repository]}\n\n"
 

Chef::Log.info("==================================== playwebserver::deploy - END ===================================== \n ")