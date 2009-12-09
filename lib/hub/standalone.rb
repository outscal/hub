module Hub
  module Standalone
    extend self

    PREAMBLE = <<-premable
#!/usr/bin/env ruby
#
# This file, hub, is generated code.
# Please DO NOT EDIT or send patches for it.
#
# Please take a look at the source from
# http://github.com/defunkt/hub
# and submit patches against the individual files
# that build hub.
#

premable

    POSTAMBLE = "Hub::Runner.execute(*ARGV)"

    def build
      root = File.dirname(__FILE__)

      standalone = ''
      standalone << PREAMBLE

      Dir["#{root}/*.rb"].each do |file|
        # skip standalone.rb
        next if file == __FILE__

        File.readlines(file).each do |line|
          next if line =~ /^\s*#/
          standalone << line
        end
      end

      standalone << POSTAMBLE
      standalone
    end
  end
end
