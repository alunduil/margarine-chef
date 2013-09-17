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

default['margarine']['path'] = "/srv/www/"
default['margarine']['pyrax_user'] = "RAX_USER"
default['margarine']['pyrax_apikey'] = "RAX_API_KEY"
default['margarine']['pyrax_region'] = "RAX_REGION"

default['margarine']['queue_user'] = "guest"
default['margarine']['queue_password'] = "guest"
default['margarine']['queue_hostname'] = "mq1.margarine.raxsavvy.com"

default['margarine']['mongodb_user'] = "margarine"
default['margarine']['mongodb_password'] = "margarineisawesome!"
default['margarine']['mongodb_connection_string'] = "mongo.objectrocket.com:12345"
default['margarine']['mongodb_database'] = "production"

default['margarine']['redis_url'] = "redis://redis.margarine.raxsavvy.com"