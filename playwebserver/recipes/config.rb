template "/etc/apache2/sites-available/default" do
	source "site-default.erb"
	mode '0440'
  owner 'ubuntu'
  group 'ubuntu'
end