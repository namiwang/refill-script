module Refill
  class Translator
    def initialize
      @opts = {
        output_file_path: './output.js'
      }

      @output_file = File.open @opts[:output_file_path], 'w'
    end

    def translate node
      puts "translating node #{node.class}"

      case node
      when AST::Expressions
        node.expressions.each do |e|
          @output_file.puts translate e
        end
        return
      when AST::Expression
        case node
        when AST::Addition
          return "#{ translate node.left } + #{ translate node.right }"
        when AST::Integer
          return node.value.to_s
        end
      end
    end

    private

  end
end
