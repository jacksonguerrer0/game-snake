module Model
  module Direction
    UP = :up,
    DOWN = :down,
    LEFT = :left,
    RIGHT = :right
  end


  class Coord < Struct.new(:row, :col)
  end

  class Food < Coord
  end

  class Snake < Struct.new(:positions)
  end

  class Grid < Struct.new(:row, :cols)
  end

  class State < Struct.new(:snake, :food, :grid, :next_direction, :game_finished)
  end

  def self.initialize_state
    Model::State.new(
      Model::Snake.new([
        Model::Coord.new(1,1),
        Model::Coord.new(0,1)
      ]),
      Model::Food.new(0, 4),
      Model::Grid.new(60, 40),
      Model::Direction::DOWN,
      false
    )
  end
end