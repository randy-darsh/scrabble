gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/emoji'


class ScrabbleTest < Minitest::Test
  def test_can_read_values_of_each_letter
    values = {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
    }
    assert_equal values, Scrabble.new.values
  end

  def test_it_can_score_a_single_letter
    assert_equal 2, Scrabble.new.score("g")
    assert_equal 5, Scrabble.new.score("k")
  end

  def test_it_can_score_a_word
    assert_equal 7, Scrabble.new.score('Fart')
    assert_equal 2, Scrabble.new.score('No')
    assert_equal 7, Scrabble.new.score('Heat')
    assert_equal 17, Scrabble.new.score('Whatever')
    assert_equal 16, Scrabble.new.score('Zebra')
  end

  def test_empty_and_nil_scores_0
    assert_equal 0, Scrabble.new.score("")
    assert_equal 0, Scrabble.new.score(nil)
  end


end
