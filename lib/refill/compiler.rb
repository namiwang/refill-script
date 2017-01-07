module Refill
  class Compiler
    # TODOC
    # @param [String, Pathname, File] source
    def compile source, output: :nil
      source = File.read source

      # TODO logger
      puts "source:\n#{source.inspect}"

      ast_root = Refill::Parser::parse(Refill::Lexer::lex(source), parse_tree: File.open('./parse_tree.dot', 'w'), verbose: false)

      # TODO
      # dot -Tpng ./parse_tree.dot -o parse_tree.png

      # TODO proper output option
      output = StringIO.new
      Refill::Translator.new(output: output).translate(ast_root)

      output.rewind
      puts "output:\n#{output.read}"
    end
  end
end
