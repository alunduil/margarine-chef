include_recipe "apt"
include_recipe "python::pip"

template "/etc/margarine/margarine.ini" do
  source "spread/spread.erb"
  mode 0600
  owner "root"
  group "root"
end

bash "start spread" do
  user "root"
  cwd node['margarine']['path']
  code <<-EOH
  PYTHONPATH="/srv/www/margarine" start-stop-daemon --start -m --pidfile /run/margarine.pid --quiet --background --exec /srv/www/margarine/bin/spread
  EOH
  action :run
end