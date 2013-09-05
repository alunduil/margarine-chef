template "/etc/margarine/margarine.ini" do
  source "blend/blend.erb"
  mode 0600
  owner "root"
  group "root"
end

template "/etc/nginx/conf.d/margarine.conf" do
  source "nginx-margarine.erb"
  mode 0644
  owner "root"
  group "root" 
  notifies :enable, "service[nginx]"
  notifies :start, "service[nginx]"
end

service "nginx" do
  supports :restart => true, :start => true, :stop => true, :reload => true
  action :nothing
end

template "/etc/init/uwsgi.conf" do
  source "blend/uwsgi.erb"
  mode 0644
  owner "root"
  group "root" 
  notifies :enable, "service[nginx]"
  notifies :start, "service[nginx]"
end

service "uwsgi" do
  supports :restart => true, :start => true, :stop => true
  action :nothing
end

bash "Start uwsgi" do
  user "root"
  cwd node['margarine']['path']
  code <<-EOH
  service uwsgi restart
  EOH
  action :run
end