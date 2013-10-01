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

if %w{ blend tinge }.any? { |s| node['margarine'][s] }
  include_recipe "margarine::#{node['margarine']['service']['provider']}"

  include_recipe "margarine::#{node['margarine']['service']['proxy']}" unless node['margarine']['service']['proxy'].nil?
end

if %w{ spread }.any? { |s| node['margarine'][s] }
  template '/etc/init/spread.conf' do
    source 'etc/init/spread.conf.erb'
    owner 'root'
    group 'root'
    mode 00644
    notifies :restart, 'service[spread]'
  end

  service 'spread' do
    case node['platform']
    when 'ubuntu'
      provider Chef::Provider::Service::Upstart
    end
    action [ :start, :enable ]
  end
end
