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

module Margarine
  module Helpers
    # Public: Put components together into a valid URI.
    #
    # components - The Hash containing the following items and optionally
    #              any others: type, username, password, hostname, port, and 
    #              database.
    #
    # Returns the URI based on the components.
    def uri(components)
      str = ''

      unless (_ = components.fetch('type', nil)).nil?
        str << _
        str << '://'
      end

      unless (_ = components.fetch('username', nil)).nil?
        str << _
        unless (_ = components.fetch('password', nil)).nil?
          str << ':'
          str << _
        end
        str << '@'
      end

      unless (_ = components.fetch('hostname', nil)).nil?
        str << _
      end

      unless (_ = components.fetch('port', nil)).nil?
        str << ':'
        str << _.to_s
      end

      unless (_ = components.fetch('database', nil)).nil?
        str << '/'
        str << _
      end

      str
    end

  end
end
