module Actions
  def self.move_snake(state)
    next_direction = state.next_direction
    next_position = calc_next_position(state)

    if position_is_valid?(state, next_position)
      move_snake_to(state, next_position)
    else
      end_game(state)
    end
  end


  private
  def calc_next_position(state)
    current_position = state.snake.positions.first

    case state.next_direction
    when LEFT
      return Model::Coord.new(current_position.row, current_position.col - 1)
    when RIGHT
      return Model::Coord.new(current_position.row, current_position.col + 1)
    when UP
      return Model::Coord.new(current_position.row - 1, current_position.col)
    when DOWN
      return Model::Coord.new(current_position.row + 1, current_position.col)
  end

  def position_is_valid?(state, position)
    grid = state.grid
    snake = state.snake

    is_valid = (
      (position.row <= grid.row && position.row >= 0) ||
      (position.col <= grid.col && position.col >= 0) ||
      !(snake.positions.include?(position))
    )
  end

  def move_snake_to(state, next_position)
    new_positions = [next_position] + state.snake.positions[0...-1]
    state.snake.positions = new_positions

    state
  end

  def end_game(state)
    state.game_finished = true

    state
  end
end