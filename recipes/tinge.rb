# Copyright (c) 2013, Rackspace Hosting

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

include_recipe "apt"
include_recipe "python::pip"

template "/etc/margarine/margarine.ini" do
  source "tinge/tinge.erb"
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
  source "tinge/uwsgi.erb"
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
