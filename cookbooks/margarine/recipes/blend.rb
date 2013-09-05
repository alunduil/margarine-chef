#include_recipe "apt"
#include_recipe "python::pip"

#package "git" do
#  action :install
#end

#package "python-dev" do
#  action :install
#end

#python_pip "pyrax" do
#  action :install
#end

#python_pip "flask" do
#  action :install
#end

#python_pip "pymongo" do
#  action :install
#end

#python_pip "pika" do
#  version "0.9.12"
#  action :install
#end

#python_pip "redis" do
#  action :install
#end

#python_pip "beautifulsoup4" do
#  action :install
#end

#directory "/var/log/margarine" do
#  owner "root"
#  group "root"
#  mode 00755
#  action :create
#end

#directory "/etc/margarine" do
#  owner "root"
#  group "root"
#  mode 00755
#  action :create
#end

#directory node.spread.path do
#  owner "root"
#  group "root"
#  mode 00755
#  recursive true
#  action :create
#end

template "/etc/margarine/margarine.ini" do
  source "blend.erb"
  mode 0600
  owner "root"
  group "root"
end

#template "/etc/margarine/logging.ini" do
#  source "logging.erb"
#  mode 0600
#  owner "root"
#  group "root"
#end

#template "/etc/margarine/pyrax.ini" do
#  source "pyrax.erb"
#  mode 0600
#  owner "root"
#  group "root"
#end

bash "install margarine" do
  user "root"
  cwd node.spread.path
  code <<-EOH
  if [[ ! -d margarine ]]; then
    git clone https://github.com/raxsavvy/margarine.git
    cd margarine
  else
    cd margarine
    git pull origin master
  fi
  PYTHONPATH="/srv/www/margarine" start-stop-daemon --start -m --pidfile /run/margarine.pid --quiet --background --exec /srv/www/margarine/bin/spread
  EOH
  action :run
end