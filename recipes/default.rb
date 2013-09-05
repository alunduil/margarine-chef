include_recipe "apt"
include_recipe "python::pip"

%w{git python-dev nginx-full build-essential}.each do |pkg|
  package pkg do
    action :install
  end
end

%w{pyrax flask pymongo redis uwsgi beautifulsoup4}.each do |pkg|
  python_pip pkg do
    action :install
  end
end

python_pip "pika" do
  version "0.9.12"
  action :install
end

directory "/var/log/margarine" do
  owner "root"
  group "root"
  mode 00755
  action :create
end

directory "/etc/margarine" do
  owner "root"
  group "root"
  mode 00755
  action :create
end

template "/etc/margarine/logging.ini" do
  source "logging.erb"
  mode 0600
  owner "root"
  group "root"
end

template "/etc/margarine/pyrax.ini" do
  source "pyrax.erb"
  mode 0600
  owner "root"
  group "root"
end

directory node['margarine']['path'] do
  owner "root"
  group "root"
  mode 00755
  recursive true
  action :create
end

bash "install Margarine" do
	user "root"
	cwd node['margarine']['path']
	code <<-EOH
	if [[ ! -d margarine ]]; then
    git clone https://github.com/raxsavvy/margarine.git
    cd margarine
  else
    cd margarine
    git pull origin master
  fi
  EOH
  action :run
end
