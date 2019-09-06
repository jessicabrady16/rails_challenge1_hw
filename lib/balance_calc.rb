# frozen_string_literal: true
class BalanceCalc

  def self.balanced?(string)
    stack = []
    string.each_char do |char|
      if open_chars.include?(char)
        stack.push(char)
      elsif close_chars.include?(char)
        if matching?(stack.last, char)
          stack.pop
        else
          return false
        end
      end
    end
    stack.empty?
  end

private


  def self.matching?(open, close)
    return true if open == '(' && close == ')'
    return true if open == '{' && close == '}'
    return true if open == '[' && close == ']'
    false
  end

  def self.open_chars
    ['(', '{', '[']
  end

  def self.close_chars
    [')', '}', ']']
  end

end

