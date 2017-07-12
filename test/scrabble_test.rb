gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test

  def setup
    @game = Scrabble.new
  end


  def test_it_can_score_a_single_letter
    assert_equal 1, @game.score("a")
    assert_equal 4, @game.score("f")
  end

  def test_it_can_score_two_letters
    assert_equal 5, @game.score("hi")
    assert_equal 2, @game.score("no")
    assert_equal 5, @game.score("uh")
  end

  def test_it_can_score_three_letters
    assert_equal 6, @game.score("nvr")
    assert_equal 4, @game.score("gna")
    assert_equal 7, @game.score("giv")
    assert_equal 6, @game.score("you")
    assert_equal 7, @game.score("upp")
  end

end
