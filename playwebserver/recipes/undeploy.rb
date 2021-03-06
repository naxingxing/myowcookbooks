


unless node[:project].nil?
  
  #log "\n\nThis is awesome!!! \n #{node[:project][:name]} - #{node[:project][:domain]}\n\n"
 
  apps = node[:opsworks][:applications]
  unless apps.nil?
    
    apps.each do |app|
      
      aname = app[:name]
      
      if aname == node[:project][:name]
        
        log "\n\n --- Undeploying #{aname} app --- \n\n"
        
        script_name = "undeploy" + aname + ".sh"
        ubuntuhome = "/home/ubuntu"
        
        log " --- START to run script " + script_name + " --- "
        cookbook_file "#{ubuntuhome}/undeploy_dist" do
          source "#{script_name}"
          mode 0755
          user "ubuntu"
          group "ubuntu"
        end

        execute "run_undeploy" do
          user "ubuntu"
          group "ubuntu"
          cwd "#{ubuntuhome}"
          command "./undeploy_dist"
        end
        log " --- END to run script " + script_name + " --- "
      end
      
    end
    
  end
  
else
  
  log "\n\n Nothing to undeploy! Please check your json input. \n\n"
  
end
        
        