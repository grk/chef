#
# Author:: Adam Edwards (<adamed@getchef.com>)
# Copyright:: Copyright (c) 2014 Chef Software, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

class Chef
  class Resource
    class DscScript < Chef::Resource

      provides :dsc_script, :on_platforms => ["windows"]

      def initialize(name, run_context=nil)
        super
        provider(Chef::Provider::DscScript)
      end

      def code(arg=nil)
        if arg && command
          raise ArgumentError, "Only one of 'code' and 'command' properties may be specified"
        end
        if arg && configuration_name
          raise ArgumentError, "Attribute `code` may not be set if `configuration_name` is set"
        end
        set_or_return(
          :code,
          arg,
          :kind_of => [ String ]
        )
      end

      def configuration_name(arg=nil)
        if arg && code
          raise ArgumentError, "Attribute `configuration_name` may not be set if `code` is set"
        end
        set_or_return(
          :configuration_name,
          arg,
          :kind_of => [ String ]
        )
      end

      def command(arg=nil)
        if arg && code
          raise ArgumentError, "Only one of 'code' and 'command' properties may be specified"
        end
        set_or_return(
          :command,
          arg,
          :kind_of => [ String ]
        )
      end

      def flags(arg=nil)
        set_or_return(
          :flags,
          arg,
          :kind_of => [ Hash ]
        )
      end

      def cwd(arg=nil)
        set_or_return(
          :cwd,
          arg,
          :kind_of => [ String ]
        )
      end

      def environment(arg=nil)
        set_or_return(
          :environment,
          arg,
          :kind_of => [ Hash ]
        )
      end

      def timeout(arg=nil)
        set_or_return(
          :timeout,
          arg,
          :kind_of => [ Integer ]
        )
      end
    end
  end
end