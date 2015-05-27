

log "\n\n=================================== playwebserver::deploy - START ==================================== \n"




log "\n\n=================================== playwebserver::deploy - RUNNING ==================================== \n"


node[:opsworks][:applications].each do |app|
  log "\n\n\n#{app[:name]}\n#{app[:application_type]}\n#{app[:slug_name]}\n\n\n"
end

unless node[:deploy]['hyyqsite'].nil?
  log "\n\nRexter testing:\n\n#{node[:deploy]['hyyqsite'][:scm][:scm_type]} - #{node[:deploy]['hyyqsite'][:scm][:repository]}\n\n"
end

cookbook_file "/tmp/deploy_dist" do
  source "deployhyyq.sh"
  mode 0755
  user 'ubuntu'
end

execute "run_deploy" do
  user "ubuntu"
  cwd "/tmp"
  command "./deploy_dist"
end

log "\n\n==================================== playwebserver::deploy - END ===================================== \n"