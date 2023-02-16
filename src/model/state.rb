module Model
  class Coord < Struct.new(:row, :col)
  end

  class Food < Coord
  end

  class Snake < Struct.new(:positions)
  end

  class Grid < Struct.new(:row, :cols)
  end

  class State < Struct.new(:snake, :food, :grid)
  end

  def self.initialize_state
    Model::State.new(
      Model::Snake.new([
        Model::Coord.new(10,10),
        Model::Coord.new(10,11)
      ]),
      Model::Food.new(1, 5),
      Model::Grid.new(60, 40)
    )
  end
end