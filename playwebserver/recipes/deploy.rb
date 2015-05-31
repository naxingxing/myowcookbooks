

log "\n\n=================================== playwebserver::deploy - START ==================================== \n"




log "\n\n=================================== playwebserver::deploy - RUNNING ==================================== \n"

unless node[:project].nil?
  log "\n\n\n\n\nThis is awesome!!! \n #{node[:project][:name]} - #{node[:project][:domain]}\n\n\n\n"
  #log "\n\n#{node[:deploy][node[:project][:name]][:scm][:repository]} - good test 1\n\n"
  unless node[:opsworks][:applications].nil?
    node[:opsworks][:applications].each do |app|
      log "#{app[:name]} #{app[:application_type]} good test"
      if app[:name] == node[:project][:name]
        log "\n\n - hello world!!!\n\n"
        pname = node[:project][:name]
        repourl = node[:deploy]["#{pname}"][:scm][:repository]
        
        =begin
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
          mode '0755'
          user 'ubuntu'
        end

        execute "run_deploy" do
          user "ubuntu"
          cwd "/tmp"
          command "./deploy_dist"
        end
        =end
        
      end
    end
  end
end
log "\n\n==================================== playwebserver::deploy - END ===================================== \n"