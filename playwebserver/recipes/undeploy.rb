


unless node[:project].nil?
  
  log "\n\nThis is awesome!!! \n #{node[:project][:name]} - #{node[:project][:domain]}\n\n"
 
  apps = node[:opsworks][:applications]
  unless apps.nil?
    
    apps.each do |app|
      
      aname = app[:name]
      
      if aname == node[:project][:name]
        
        log "\n\n --- Undeploying #{aname} app --- \n\n"
        
        script_name = "undeploy" + aname + ".sh"
        
        cookbook_file "/tmp/undeploy_dist" do
          source script_name
          mode "0755"
          user "ubuntu"
        end

        execute "run_undeploy" do
          user "ubuntu"
          cwd "/tmp"
          command "./undeploy_dist"
        end
        
      end
      
    end
    
  end
  
else
  
  log "\n\n Nothing to undeploy! Please check your json input. \n\n"
  
end
        
        