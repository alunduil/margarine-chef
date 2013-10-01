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

loggers = {}

if node['margarine']['logging']['default']
  loggers = {
    'root' => {
      :level => :INFO,
      :handlers => 'syslog_h',
    },
    'margarine'=> {
      :level => :INFO,
      :qualname => 'margarine',
      :handlers => 'syslog_h',
    },
    'margarine_debug' => {
      :level => :DEBUG,
      :qualname => 'margarine',
      :handlers => 'syslog_debug_h',
    },
  }
end

search(:margarine_loggers, '*:*').each do |logger|
  loggers[logger.delete(:id)] = logger
end

handlers = {
  'stream_h'=> {
    :class => 'StreamHandler',
    :level => :INFO,
    :formatter => 'default_f',
    :args => '(sys.stderr,)',
  },
  'stream_debug_h' => {
    :class => 'StreamHandler',
    :level => :DEBUG,
    :formatter => 'default_debug_f',
    :args => '(sys.stderr,)',
  },
  'syslog_h' => {
    :class => 'handlers.SysLogHandler',
    :level => :INFO,
    :formatter => 'default_f',
    :args => '()',
  },
  'syslog_debug_h' => {
    :class => 'handlers.SysLogHandler',
    :level => :DEBUG,
    :formatter => 'default_debug_f',
    :args => '()',
  },
}

search(:margarine_handlers, '*:*').each do |handler|
  handlers[handler.delete(:id)] = handler
end

formatters = {
  'default_f' => {
    :format => '%(name)s:%(levelname)s: %(process)d: %(message)s',
  },
  'default_debug_f' => {
    :format => '%(filename)s:%(lineno)d: %(process)d: %(message)s',
  },
}

search(:margarine_formatters, '*:*').each do |formatter|
  formatters[formatter.delete(:id)] = formatter
end

template '/etc/margarine/logging.ini' do
  source 'etc/margarine/logging.ini.erb'
  owner node['margarine']['user']
  group node['margarine']['group']
  mode 00600
  variables(
    :loggers => loggers,
    :handlers => handlers,
    :formatters => formatters,
  )
end
