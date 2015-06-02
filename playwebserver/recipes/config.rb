

unless node[:project].nil?
  
  template "/etc/apache2/sites-available/000-default.conf" do
  	source "site-default.erb"
  	mode 0440
    variables({
         :domain => node[:project][:domain]
    })
  end

  service 'apache2' do
    action :restart
  end
  
else
  
  log "There is no domain name input. Please check your input json."
  
end