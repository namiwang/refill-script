require 'rltk/ast'

module Refill
  module AST
    class Expression < RLTK::ASTNode
    end

    class Expressions < RLTK::ASTNode
      value :expressions, Array
    end

    class Integer < Expression
      value :value, ::Integer
    end

    class BinaryExpr < Expression
      child :left, Expression
      child :right, Expression
    end

    class Addition < BinaryExpr; end
  end
end
