# frozen_string_literal: true

class ChallengeBalance
  @@openers = []

  def self.par(c)
    open = '('
    close = ')'
    return method_name(c, open, close)
  end

  def self.curl(c)
    open = '{'
    close = '}'
    return method_name(c, open, close)
  end

  def self.square(c)
    open = '['
    close = ']'
   return method_name(c, open, close)
  end

  def self.method_name(c, open, close)
    if c == open then @@openers.push(c) end
    if c == close then last_opener = @@openers.pop; return false unless last_opener == open end
    true
  end

  def self.balanced?(string)
    @@openers = []
    string.each_char do |c|
      return false unless par(c) && curl(c) && square(c)
    end
    @@openers.empty?
  end
end

#  "( { [ "
# describe Challenge1 do
#   it '#balanced verification 1' do
#     expect(Challenge1.balanced?('(a[0]+b[2c[6]]) {24 + 53}')).to eq(true)
#   end
#
#   it '#balanced verification 2' do
#     expect(Challenge1.balanced?('[()]{}([])')).to eq(true)
#   end
#
#   it '#balanced verification 3' do
#     expect(Challenge1.balanced?('((b)')).to eq(false)
#   end
#
#   it '#balanced verification 4' do
#     expect(Challenge1.balanced?('(c]')).to eq(false)
#   end
#
#   it '#balanced verification 5' do
#     expect(Challenge1.balanced?('{(a[])')).to eq(false)
#   end
#
#   it '#balanced verification 6' do
#     expect(Challenge1.balanced?('([)]')).to eq(false)
#   end
#
#   it '#balanced verification 7' do
#     expect(Challenge1.balanced?('')).to eq(true)
#   end
# end
