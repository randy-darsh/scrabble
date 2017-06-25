gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'


class ScrabbleTest < Minitest::Test
  def test_can_read_values_of_each_letter
    game = Scrabble.new
    values = {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
    }

    assert_equal values, game.values
  end

  def test_it_can_score_hello
    game = Scrabble.new

    assert_equal 8, game.score("hello")
  end

  def test_it_scores_emtpy_quotes_as_0
    game = Scrabble.new

    assert_equal 0, game.score("")
  end

  def test_it_scores_nil_as_0
    game = Scrabble.new

    assert_equal 0, game.score(nil)
  end

  def test_the_case_doesnt_matter
    game = Scrabble.new

    assert_equal 8, game.score("hello")
    assert_equal 8, game.score("HELLO")
    assert_equal 8, game.score("HeLlO")
  end

  def test_it_can_score_multiple_words
    game = Scrabble.new

    assert_equal 8, game.score("doodoo")
    assert_equal 16, game.score("polywog")
    assert_equal 16, game.score("daffodil")
    assert_equal 12, game.score("remington")
    assert_equal 15, game.score("scuttlebutt")
  end


end
