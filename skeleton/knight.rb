require 'set'

class KnightPathFinder
  def initialize(pos)
    @pos = pos
    @visted_positions = Set.new
    @queue = []
  end

  def find_path(pos)
    self.build_move_tree

  end

  def build_move_tree
    @queue += [@pos]
    until queue.empty?
      start_pos = queue.shift
      queue += new_move_positions(start_pos)
    end
  end

  def new_move_positions(pos)
    pos_moves = [2, -2, 1, -1].permutation(2).to_a.reject { |a, b| a + b == 0 }
    pos_moves.map! { |(x, y)| [(x + pos.first), (y + pos.last)] }
    pos_moves = pos_moves.select do |pos|
      KnightPathFinder.valid_move(pos) && !visted_positions.include?(pos)
    end
    @visted_positions += pos_moves

    pos_moves
  end

  def self.valid_move(pos)
    x, y = pos
    x.between?(0, 7) && y.between?(0, 7)
  end

  private
  attr_accessor :visted_positions

end
#
# load 'knight.rb'
# pos = [0, 0]
# test = KnightPathFinder.new(pos)
# test.new_move_positions(pos)
# p test
