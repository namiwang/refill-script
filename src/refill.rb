require_relative 'refill/lexer'
require_relative 'refill/ast'
require_relative 'refill/parser'
require_relative 'refill/translator'

# for dev only
require 'irb'
require 'pp'

module Refill
  def self.drive
    source = File.read('./test.refill')

    puts "source: #{source.inspect}"

    ast_root = Refill::Parser::parse(Refill::Lexer::lex(source), parse_tree: File.open('./parse_tree.dot', 'w'), verbose: false)

    # dot -Tpng ./parse_tree.dot -o parse_tree.png

    Refill::Translator.new().translate(ast_root)
  end
end

Refill::drive
