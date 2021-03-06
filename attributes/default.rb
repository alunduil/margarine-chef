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

default['margarine']['components'] = ['blend', 'spread']

default['margarine']['user'] = 'margarine'
default['margarine']['group'] = 'margarine'

default['margarine']['install']['method'] = 'pip'
default['margarine']['install']['commit'] = 'master'
default['margarine']['install']['repository'] = 'git+https://github.com/raxsavvy/margarine.git' # rubocop:disable LineLength

default['margarine']['service']['provider'] = :uwsgi
default['margarine']['service']['hostname'] = 'localhost'
default['margarine']['service']['port'] = 5000
default['margarine']['service']['proxy'] = nil

default['margarine']['urls']['tinge'] = 'http://' + node['hostname']
default['margarine']['urls']['blend'] = 'http://api.' + node['hostname'] + '/v1/' # rubocop:disable LineLength

default['margarine']['datastore']['type'] = 'mongodb'
default['margarine']['datastore']['username'] = nil
default['margarine']['datastore']['password'] = nil
default['margarine']['datastore']['hostname'] = 'localhost'
default['margarine']['datastore']['port'] = 27017
default['margarine']['datastore']['database'] = 'production'

default['margarine']['email']['type'] = 'smtp'
default['margarine']['email']['username'] = nil
default['margarine']['email']['password'] = nil
default['margarine']['email']['hostname'] = 'localhost'
default['margarine']['email']['port'] = 25
default['margarine']['email']['from'] = 'no-reply@' + node['hostname']

default['margarine']['token_store']['type'] = 'redis'
default['margarine']['token_store']['username'] = nil
default['margarine']['token_store']['password'] = nil
default['margarine']['token_store']['hostname'] = 'localhost'
default['margarine']['token_store']['port'] = 6379

default['margarine']['queue']['type'] = 'amqp'
default['margarine']['queue']['username'] = 'guest'
default['margarine']['queue']['password'] = 'guest'
default['margarine']['queue']['hostname'] = 'localhost'
default['margarine']['queue']['port'] = 5672

default['margarine']['security']['uuid'] = nil

default['margarine']['logging']['directory'] = '/var/log/margarine'

default['margarine']['logging']['loggers'] = {
  root: {
    level: :INFO,
    handlers: 'file_h',
  },
  margarine: {
    level: :INFO,
    qualname: 'margarine',
    handlers: 'file_h',
  },
  margarine_debug: {
    level: :DEBUG,
    qualname: 'margarine',
    handlers: 'file_debug_h',
  },
}

default['margarine']['logging']['handlers'] = {
  file_h: {
    class: 'FileHandler',
    level: :INFO,
    formatter: 'default_f',
    args: "('#{node['margarine']['logging']['directory']}/margarine.log',)",
  },
  file_debug_h: {
    class: 'FileHandler',
    level: :DEBUG,
    formatter: 'default_debug_f',
    args: "('#{node['margarine']['logging']['directory']}/margarine.debug.log',)", # rubocop:disable LineLength
  },
}

default['margarine']['logging']['formatters'] = {
  default_f: {
    format: '%(name)s:%(levelname)s: %(process)d: %(message)s',
  },
  default_debug_f: {
    format: '%(pathname)s:%(lineno)d: %(process)d: %(message)s',
  },
}
