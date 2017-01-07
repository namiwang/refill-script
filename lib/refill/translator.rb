module Refill
  class Translator
    def initialize output: 
      @output = output
    end

    def translate node
      # TODO logger
      puts "translating node #{node.class}"

      case node
      when AST::Expressions
        translate_and_write_expressions node
      else
        raise 'UnknownNode'
      end
    end

    private

    def translate_and_write_expressions expressions
      expressions.expressions.each do |e|
        case e
        when AST::Expressions
          translate_and_write_expressions e
        when AST::Expression
          @output.write "#{translate_expression e}\n"
        else
          raise 'UnknownExpressions'
        end
      end
    end

    def translate_expression expression
      case expression
      when AST::Addition
        return "( #{translate_expression expression.left} + #{translate_expression expression.right} )"
      when AST::Integer
        return "( #{expression.value.to_s} )"
      when AST::Literal
        return "( \"#{expression.value.to_s}\" )"
      else
        raise 'UnknownExpression'
      end
    end

  end
end
