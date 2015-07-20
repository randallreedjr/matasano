class FixedXOR
  def initialize(string1, string2)
    @string1 = string1
    @string2 = string2
  end

  def encode
    binary1 = decode_hex(@string1)
    binary2 = decode_hex(@string2)
    xor_binary = xor(binary1, binary2)
    binary_to_hex(xor_binary)
  end

  private
  def decode_hex(string)
    @binary = ''
    string.each_char do |char|
      @binary += char.to_i(16).to_s(2).rjust(4,'0')
    end
    return @binary
  end

  def xor(string1, string2)
    string1.split('').collect.with_index do |bit, index|
      bit2 = string2[index]
      bit.to_i(2) ^ bit2.to_i(2)
    end.join('')
  end

  def binary_to_hex(bits)
    bits.to_i(2).to_s(16)
  end
end

converter = FixedXOR.new('1c0111001f010100061a024b53535009181c','686974207468652062756c6c277320657965')
puts converter.encode