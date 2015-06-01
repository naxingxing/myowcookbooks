

log "=================================== playwebserver::deploy - START ===================================="

=begin
{
  "project" : {
    "name" : "hyyqsite",
    "domain" : "yoyo.com"
  }
}
=end

log "=================================== playwebserver::deploy - RUNNING ===================================="

unless node[:project].nil?
  log "project name : #{node[:project][:name]} - project domain : #{node[:project][:domain]}"
  apps = node[:opsworks][:applications]
  unless apps.nil?
    apps.each do |app|
      #log "#{app[:name]} #{app[:application_type]} good test"
      aname = app[:name]
      if aname == node[:project][:name]
        log "\n\n --- Deploying #{aname} --- \n\n"
        pname = node[:project][:name]
        
        repourl = node[:deploy]["#{pname}"][:scm][:repository]
        
        

        script_name = "deploy" + pname + ".sh"
        
        log " --- START to run script " + script_name + " --- "
        
        cookbook_file "/tmp/deploy_dist" do
          source "deployhyyqsite.sh"
          mode 0755
          user 'ubuntu'
        end

        execute "run_deploy" do
          user "ubuntu"
          cwd "/tmp"
          command "./deploy_dist"
        end
        
        
        log " --- END to run script " + script_name + " --- "
        
      end
    end
  end
  
else
  
  log "\n\n Nothing to deploy! Please check your json input. \n\n"
  
end

log "==================================== playwebserver::deploy - END ====================================="










