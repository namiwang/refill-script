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
        translate_expressions node
      end
    end

    private

    def translate_expressions expressions
      expressions.expressions.each do |e|
        case e
        when AST::Expressions
          translate_expressions e
        when AST::Expression
          @output_file.write "#{translate_expression e}\n"
        end
      end
    end

    def translate_expression expression
      case expression
      when AST::Addition
        return "( #{translate_expression expression.left} + #{translate_expression expression.right} )"
      when AST::Integer
        return "( #{expression.value.to_s} )"
      end
    end

  end
end
