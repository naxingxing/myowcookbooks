

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

ruby_block "initialize" do
  block do
    ENV['PATH'] = "#{ENV['PATH']}:/opt/activator-1.3.2"
  end
end

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
        
        unless repourl.nil?
          git "#{repourl}" do
            repository "#{repourl}"
            action :sync
            destination "/home/ubuntu/download/#{pname}"
          end
        end

        script_name = "deploy" + pname + ".sh"
        
        log " --- START to run script " + script_name + " --- "
        
        env 'M2_HOME' do
            value node['maven']['m2_home']
            action :create
          end
        
        execute 'trydep2' do
          command "cd /home/ubuntu/download/hyyqsite && activator dist"
        end
        
        log " --- END to run script " + script_name + " --- "
        
      end
    end
  end
  
else
  
  log "\n\n Nothing to deploy! Please check your json input. \n\n"
  
end

log "==================================== playwebserver::deploy - END ====================================="










