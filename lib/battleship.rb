require_relative "./board"

class Battleship

  attr_reader :computer_board, :player_board

  def initialize
    @player_board = Board.new(4)
    @computer_board = Board.new(4)
  end

  def play()
    puts "We will play"

    @computer_board.place_two_unit_ship("A1","A2")
    @computer_board.place_three_unit_ship("C1", "C2", "C3")

    puts "I have laid out my ships on the grid."
    puts  "You now need to layout your two ships."
    puts "The first is two units long and the"
    puts "second is three units long."
    puts "The grid has A1 at the top left and D4 at the bottom right."
    puts
    puts "Enter the squares for the two-unit ship: "

    two_unit = gets.chomp

    fc = two_unit.split()[0]
    sc = two_unit.split()[1]

    @player_board.place_two_unit_ship(fc, sc)


    puts "Enter the squares for the three-unit ship: "

    three_unit = gets.chomp

    fc = three_unit.split()[0]
    sc = three_unit.split()[1]
    tc = three_unit.split()[2]

    @player_board.place_three_unit_ship(fc, sc, tc)

    loop do
      @computer_board.to_string

      puts "Take a shot!"
      user_shot_coord = gets.chomp

      user_hit = @computer_board.take_shot(user_shot_coord)
      if user_hit == true
        puts "You got a hit!"
      else
        puts "You missed."
      end
      @computer_board.to_string

      if @computer_board.win?
        puts "You WON!!"
        break
      end

      best_cell = @player_board.find_next_empty_space
      computer_hit = @player_board.take_shot(best_cell)
      if computer_hit == true
        puts "Computer got a hit."
      else
        puts "Compter missed!"
      end

        if @player_board.win?
          puts "Sorry, you lost!"
          break
        end
    end

  end

end

puts "Welcome to BATTLESHIP!"
puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"

loop do
  user_input = gets.chomp
  if user_input == 'p'
    battleship = Battleship.new()
    battleship.play()
    break
  elsif user_input == 'q'
    break
  else
    puts "You know how to play battleship, c'mon."
  end
end
