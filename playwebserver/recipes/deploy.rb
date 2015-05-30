

log "\n\n=================================== playwebserver::deploy - START ==================================== \n"




log "\n\n=================================== playwebserver::deploy - RUNNING ==================================== \n"

unless node[:project].nil?
  log "\n\n\n\n\nThis is awesome!!! \n #{node[:project][:name]} - #{node[:project][:domain]}\n\n\n\n"
  #log "\n\n#{node[:deploy][node[:project][:name]][:scm][:repository]} - good test 1\n\n"
  unless app.nil?
    app.each do |one|
      log "#{app[:name]} #{app[:application_type]} good test"
    end
  end
else
node[:opsworks][:applications].each do |app|
  log "\n\n\n-app name: #{app[:name]}\n-application_type: #{app[:application_type]}\n-slug_name: #{app[:slug_name]}\n\n\n"
end

unless node[:deploy]['hyyqsite'].nil?
  git "#{node[:deploy]['hyyqsite'][:scm][:repository]}" do
    repository node[:deploy]['hyyqsite'][:scm][:repository]
    action :sync
    user "ubuntu"
    group "ubuntu"
    destination "/home/ubuntu/download/hyyqsite"
  end
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
end
log "\n\n==================================== playwebserver::deploy - END ===================================== \n"