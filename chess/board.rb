require_relative "piece"
require_relative "pieces/nullpiece"

class Board
    attr_reader :rows, :null_piece

    def initialize
        @rows = Array.new(8) { Array.new(8) }
        @null_piece = Nullpiece.instance

        (0...rows.length).each do |row|
            (0...rows.length).each do |col|
                light_rows = [0, 1]
                dark_rows = [6, 7]

                if light_rows.include?(row)
                    rows[row][col] = Piece.new(:light, self, [row, col])
                elsif dark_rows.include?(row)
                    rows[row][col] = Piece.new(:dark, self, [row, col])
                else
                    rows[row][col] = null_piece
                end
            end
        end        
    end

    def [](pos)
        row, col = pos
        rows[row][col]
    end

    def []=(pos, val)
        row, col = pos
        rows[row][col] = val
    end

    def move_piece(start_pos, end_pos)
        row, col = end_pos
        valid_pos = (0..7).to_a
        raise "No piece at that position" if self[start_pos] == null_piece
        raise "Piece cannot move to destination" if !valid_pos.include?(row) || !valid_pos.include?(col)
        move_value = self[start_pos]
        self[start_pos] = null_piece
        self[end_pos] = move_value
    end
end

# b = Board.new

# p b.rows


#Created classes for each piece and every module, 
#changed logic in Board.initialize so that it builds board with instances of Piece class and Nullpiece.instance
