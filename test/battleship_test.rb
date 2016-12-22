require "minitest/autorun"
require "minitest/pride"
require "./lib/battleship"

class BattleshipTest < MiniTest::Test

  def test_player_board_exist
    battleship = Battleship.new
    assert_instance_of Board, battleship.player_board
  end

  def test_computer_board_exist
    battleship = Battleship.new
    assert_instance_of Board, battleship.computer_board
  end
end
