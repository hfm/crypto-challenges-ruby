require 'test/unit'

class TestSets1 < Test::Unit::TestCase
  # http://cryptopals.com/sets/1/challenges/1
  def test_hex_to_string
    require 'base64'
    hex = '49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d'

    actual = Base64.strict_encode64 [hex].pack 'H*'
    expect = 'SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t'
    assert_equal expect, actual
  end

  # http://cryptopals.com/sets/1/challenges/2
  def fixed_xor(buf1, buf2)
    buf1.scan(/../).map(&:hex) # convert hex to integer
      .map.with_index { |c, i| c ^ buf2.scan(/../)[i].hex } # xor
      .map {|c| c.to_s(16) } # convert integer to hex
      .join
  end

  def test_fixed_xor
    str1 = '1c0111001f010100061a024b53535009181c'
    str2 = '686974207468652062756c6c277320657965'

    actual = fixed_xor(str1, str2)
    expect = '746865206b696420646f6e277420706c6179'
    assert_equal expect, actual
  end
end
