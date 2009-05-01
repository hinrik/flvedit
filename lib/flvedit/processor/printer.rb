module FLV
  module Edit  
    module Processor
      
      # Printer is a small utility class to print out FLV chunks.
      class Printer
        def initialize(io, options={})
          @io = io
          @options = {:width => 50, :column_width => 15, :separator => "| "}.merge(options)
          @margin_left = ""
        end

        def header(left, right)
          @io.puts left + @options[:separator] + right
          @margin_left = " "*left.length + @options[:separator]
        end

        # Prints out a hash (or any list of key-value pairs) in two columns
        def values(hash)
          hash.each do |key, value|
            @io.puts "#{@margin_left}#{key.to_s.ljust(@options[:column_width])}: #{value.inspect.delete(':"')}"
          end
        end
      end
    
    end
  end
end