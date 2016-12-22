class Board
  attr_reader :size , :grid

  def initialize(size)
    @size = size
    @characters = ("A".."Z").to_a
    @grid = initialize_grid
  end

  def initialize_grid
    g = []
    (@characters[0]..@characters[@size - 1]).each do |letter|
      row = []
      (1..@size).each do |number|
        row << " "
      end

      g << row
    end

    g
  end

  def place_two_unit_ship(first_coord, second_coord)

    fc_row = first_coord.split("")[0]
    fc_column = first_coord.split("")[1]
    sc_row = second_coord.split("")[0]
    sc_column = second_coord.split("")[1]

    fc_row_number = @characters.index(fc_row)
    fc_column_number = fc_column.to_i - 1
    sc_row_number = @characters.index(sc_row)
    sc_column_number = sc_column.to_i - 1

    @grid[fc_row_number][fc_column_number] = "S"
    @grid[sc_row_number][sc_column_number] = "S"

  end

  def place_three_unit_ship(first_coord, second_coord, third_coord)
    fc_row = first_coord.split("")[0]
    fc_column = first_coord.split("")[1]
    sc_row = second_coord.split("")[0]
    sc_column = second_coord.split("")[1]
    th_row = third_coord.split("")[0]
    th_column = third_coord.split("")[1]

    fc_row_number = @characters.index(fc_row)
    fc_column_number = fc_column.to_i - 1
    sc_row_number = @characters.index(sc_row)
    sc_column_number = sc_column.to_i - 1
    th_row_number = @characters.index(th_row)
    th_column_number = th_column.to_i - 1

    @grid[fc_row_number][fc_column_number] = "S"
    @grid[sc_row_number][sc_column_number] = "S"
    @grid[th_row_number][th_column_number] = "S"
  end

  def to_string
    puts "==========="
    header = (1..@size).to_a
    header.unshift('.')
    puts header.join(' ')

    @grid.each_with_index do |row, i|
      character = @characters[i]
      row_string =  character + " " + row.join(' ')
      no_ss = row_string.gsub("S", " ")
      puts no_ss
    end
    puts "==========="
  end

  def to_string_ships
    puts "==========="
    header = (1..@size).to_a
    header.unshift('.')
    puts header.join(' ')

    @grid.each_with_index do |row, i|
      character = @characters[i]
      row_string =  character + " " + row.join(' ')
      puts row_string
    end
    puts "==========="
  end

  def take_shot(coord)
    fc_row = coord.split("")[0]
    fc_column = coord.split("")[1]

    fc_row_number = @characters.index(fc_row)
    fc_column_number = fc_column.to_i - 1

    hit = false
    if @grid[fc_row_number][fc_column_number] == "S"
      @grid[fc_row_number][fc_column_number] = "H"
      hit = true
    else
      @grid[fc_row_number][fc_column_number] = "M"
    end

    hit

  end

  def win?
    win = true
    @grid.each do |row|
      row.each do |column|
        if column == "S"
          win = false
        end
      end
    end

    win
  end

  def find_next_empty_space

    @grid.each_with_index do |row, i|
      row.each_with_index do |column, j|
        if column != "H" && column != "M"
          row_label  = @characters[i]
          column_label = j + 1
          return row_label + column_label.to_s
        end
      end
    end

  end

end
