

log "\n\n=================================== playwebserver::deploy - START ==================================== \n"




log "\n\n=================================== playwebserver::deploy - RUNNING ==================================== \n"

unless node[:project].nil?
  log "\n\n\n\n\nThis is awesome!!! \n #{node[:project][:name]} - #{node[:project][:domain]}\n\n\n\n"
  #log "\n\n#{node[:deploy][node[:project][:name]][:scm][:repository]} - good test 1\n\n"
  apps = node[:opsworks][:applications]
  unless apps.nil?
    apps.each do |app|
      log "#{app[:name]} #{app[:application_type]} good test"
      aname = app[:name]
      if aname == node[:project][:name]
        log "\n\n --- Deploying #{aname} --- \n\n"
        pname = node[:project][:name]
        
        repourl = node[:deploy]["#{pname}"][:scm][:repository]
        
        unless repourl.nil?
          git repourl do
            repository repourl
            action :sync
            user "ubuntu"
            group "ubuntu"
            destination "/home/ubuntu/download/#{pname}"
          end
        end

 
        
      end
    end
  end
end
log "\n\n==================================== playwebserver::deploy - END ===================================== \n"