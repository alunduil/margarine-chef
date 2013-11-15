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

include_recipe 'margarine::install_source_dependencies'

include_recipe 'margarine::user'

package 'git'

Chef::Log.info("install path: #{node['margarine']['install']['path'].sub(/\/current$/, '')}")
Chef::Log.debug("margarine.install.path raw: #{node['margarine']['install']['path']}")

deploy node['margarine']['install']['path'].sub(/\/current$/, '') do
  repository node['margarine']['install']['repository']
  revision node['margarine']['install']['version']

  user node['margarine']['user']
  group node['margarine']['group']

  keep_releases 0

  symlink_before_migrate Hash.new
  create_dirs_before_symlink []
  purge_before_symlink []
  symlinks Hash.new
end

unless node['margarine']['install']['path'].end_with?('/current')
  node.set['margarine']['install']['path'] += '/current'
end
