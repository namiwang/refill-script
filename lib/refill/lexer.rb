require 'rltk/lexer'

module Refill
  class Lexer < RLTK::Lexer
    rule(/\n/) {
      :DELI_LINE
    }

    # whitespace
    rule(/\ /)

    rule(/\+/) { :OP_PLUS }
    # rule(/-/)  { :OP_SUBTRACT }
    # rule(/=/)  { :OP_ASSIGN }

    # rule(/\(/) { :BR_PAREN_L }

    rule(/[1-9][0-9]*/) { |t| [:INTEGER, t.to_i] }

    # string literal
    rule(/"/) { push_state :string }
    rule(/[^"]*/, :string) { |t| [:LITERAL, t.to_s] }
    rule(/"/, :string) { pop_state }

    rule(/[1-9][0-9]*/) { |t| [:INTEGER, t.to_i] }

    # rule(/[A-Za-z][A-Za-z0-9]*/) { |t| [:IDENTIFIER, t] }
  end
end
