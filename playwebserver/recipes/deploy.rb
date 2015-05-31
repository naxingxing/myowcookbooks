

log "\n\n=================================== playwebserver::deploy - START ==================================== \n"

=begin
{
  "project" : {
    "name" : "<projectname>",
    "domain" : "yoyo.com"
  }
}
=end

log "\n\n=================================== playwebserver::deploy - RUNNING ==================================== \n"

unless node[:project].nil?
  log "\n\n #{node[:project][:name]} - #{node[:project][:domain]} \n\n"
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
          git repourl do
            repository repourl
            action :sync
            user "ubuntu"
            group "ubuntu"
            destination "/home/ubuntu/download/#{pname}"
          end
        end

        script_name = "deploy" + pname + ".sh"

        cookbook_file "/tmp/deploy_dist" do
          source script_name
          mode '0755'
          user 'ubuntu'
        end

        execute "run_deploy" do
          user "ubuntu"
          cwd "/tmp"
          command "./deploy_dist"
        end
        
      end
    end
  end
end
log "\n\n==================================== playwebserver::deploy - END ===================================== \n"