template "/etc/apache2/sites-available/000-default.conf" do
	source "site-default.erb"
	mode 0440
end