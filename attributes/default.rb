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

default['margarine']['tinge']['url'] = 'http://' + node['hostname']

default['margarine']['blend']['url'] = 'http://api.' + node['hostname'] + '/v1/'

default['margarien']['datastore']['type'] = 'mongodb'
default['margarine']['datastore']['username'] = nil
default['margarine']['datastore']['password'] = nil
default['margarine']['datastore']['hostname'] = 'localhost'
default['margarine']['datastore']['port'] = 27017
default['margarine']['datastore']['database'] = 'production'

default['margarine']['pyrax']['username'] = nil
default['margarine']['pyrax']['password'] = nil
default['margarine']['pyrax']['type'] = 'rackspace'

default['margarine']['email']['type'] = 'smtp'
default['margarine']['email']['username'] = nil
default['margarine']['email']['password'] = nil
default['margarine']['email']['hostname'] = 'localhost'
default['margarine']['email']['port'] = 25
default['margarine']['email']['from'] = 'no-reply@' + node['hostname']

default['margarine']['flask']['host'] = 'localhost'
default['margarine']['flask']['port'] = 5000
default['margarine']['flask']['debug'] = false

default['margarine']['service']['type'] = :uwsgi

default['margarine']['uwsgi']['host'] = 'localhost'
default['margarine']['uwsgi']['port'] = 5000

default['margarine']['token_store']['type'] = 'redis'
default['margarine']['token_store']['username'] = nil
default['margarine']['token_store']['password'] = nil
default['margarine']['token_store']['hostname'] = 'localhost'
default['margarine']['token_store']['port'] = 6379

# Data Bags for logging configuration items.

default['margarine']['queue']['type'] = 'amqp'
default['margarine']['queue']['username'] = 'guest'
default['margarine']['queue']['password'] = 'guest'
default['margarine']['queue']['hostnaem'] = 'localhost'
default['margarine']['queue']['port'] = 55672
default['margarine']['queue']['wait'] = 5

default['margarine']['security']['uuid'] = nil


