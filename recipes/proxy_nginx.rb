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

package 'nginx'

%w{ tinge blend }.each do |service|
  if node['margarine'][service]
    template "/etc/nginx/sites-available/#{service}" do
      source 'etc/nginx/sites-available/service.erb'
      owner 'root'
      group 'root'
      mode 00600
      variables(
        :service => service,
        :name => node['margarine']['urls'][service].sub('http://', '').sub(/\/v\d+\//, ''),
      )
      notifies :restart, 'service[nginx]'
    end

    link "/etc/nginx/sites-enabled/#{service}" do
      to "/etc/nginx/sites-available/#{service}"
      notifies :restart, 'service[nginx]'
    end

    link '/etc/nginx/sites-enabled/default' do
      notifies :restart, 'service[nginx]'
      action :delete
    end
  end
end

service 'nginx' do
  action [ :start, :enable ]
end
