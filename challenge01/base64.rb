require 'pry'
class Base64
  def decode_hex(string)
    @binary = ''
    string.each_char do |char|
      @binary += char.to_i(16).to_s(2).rjust(4,'0')
    end
    return @binary
  end

  def encode_string
    @base_64 = ''
    @binary.split('').each_slice(6) do |bits|
      @base_64 += encode_char(bits.join('').ljust(6,'0'))
    end
    @base_64
  end

  private
  def encode_char(bits)
    index = bits.to_i(2)
    if index < 26
      #A-Z
      (index + 65).chr
    elsif index >= 26 && index < 52
      #a-z
      (index + 71).chr
    elsif index >= 52 && index < 62
      #0-9
      (index - 4).chr
    elsif index == 62
      '+'
    elsif index == 63
      '/'
    end
  end
end

converter = Base64.new
converter.decode_hex('49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d')
puts converter.encode_string