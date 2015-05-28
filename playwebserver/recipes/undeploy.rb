
cookbook_file "/tmp/undeploy_dist" do
  source "undeployhyyq.sh"
  mode 0755
  user 'ubuntu'
end

execute "run_undeploy" do
  user "ubuntu"
  cwd "/tmp"
  command "./undeploy_dist"
end