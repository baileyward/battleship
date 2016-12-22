require "minitest/autorun"
require "minitest/pride"
require "./lib/board"

class BoardTest < MiniTest::Test

  def test_it_has_a_size
    board = Board.new(4)
    assert_equal 4, board.size
  end

  def test_is_board
    board = Board.new(4)
    assert_instance_of Board, board
  end

  def test_initalize_grid
    board = Board.new(2)
    expected_grid = [[" ", " "],[" ", " "]]
    assert_equal expected_grid, board.grid
  end


  def test_put_two_ships
    board = Board.new(2)
    board.place_two_unit_ship("A1", "A2")
    expected_grid = [["S",  "S"],[" ", " "]]
    assert_equal expected_grid, board.grid
  end

  def test_put_three_ships
    board = Board.new(3)
    board.place_three_unit_ship("A1", "A2", "A3")
    expected_grid = [["S",  "S", "S"],[" ", " ", " "],[" ", " ", " "]]
    assert_equal expected_grid, board.grid
  end


  def test_take_shot_hit
    board = Board.new(2)
    board.place_two_unit_ship("A1", "A2")

    hit = board.take_shot("A1")

    expected_grid = [["H",  "S"],[" ", " "]]
    assert_equal expected_grid, board.grid
    assert_equal true, hit
  end

  def test_take_shot_miss
    board = Board.new(2)
    board.place_two_unit_ship("A1", "A2")

    hit = board.take_shot("B2")

    expected_grid = [["S",  "S"],[" ", "M"]]
    assert_equal expected_grid, board.grid
    assert_equal false, hit
  end

  def test_not_win
    board = Board.new(4)

    board.place_two_unit_ship("A1", "A2")

    assert_equal false, board.win?
  end

  def test_win
    board = Board.new(4)

    board.place_two_unit_ship("A1", "A2")
    board.take_shot("A1")
    board.take_shot("A2")

    assert_equal true, board.win?
  end

  def test_empty_space
    board = Board.new(4)

    board.place_two_unit_ship("A1", "A2")
    board.take_shot("A1")
    board.take_shot("A2")

    assert_equal "A3", board.find_next_empty_space
  end

end
