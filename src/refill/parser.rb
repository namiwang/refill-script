require 'rltk/parser'

module Refill
  class Parser < RLTK::Parser
    left :OP_PLUS

    production :block do
      clause 'expressions' do |e| e end
    end

    production :expressions do
      clause 'expressions DELI_LINE expression' do |es, _, e|
        AST::Expressions.new ( es.expressions + [e] )
      end
      clause('expressions DELI_LINE'){ |e, _| AST::Expressions.new [e] }
      clause('expression'){ |e| AST::Expressions.new [e] }
    end

    production :expression do
      clause('INTEGER') { |i| AST::Integer.new i }
      clause('LITERAL') { |l| AST::Literal.new l }

      clause('expression OP_PLUS expression') { |e0, _, e1| AST::Addition.new e0, e1 }
    end

    finalize(use: 'refill.table')
  end
end
