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
end
