require "ruby2d"

module View
  class Ruby2dView
    def initialize
      @pixel_size = 25
    end

    def render(state)
      extend Ruby2D::DSL

      grid = state.grid

      set(
        title: "Snake",
        width: @pixel_size * grid.cols,
        height: @pixel_size * grid.cols
      )

      render_snake(state)
      render_food(state)

      show
    end

    private

    def render_snake(state)
      extend Ruby2D::DSL

      snake = state.snake
      snake.positions.each_with_index do | position, index |
        Square.new(
          x: @pixel_size * position.col, y: @pixel_size * position.row,
          size: @pixel_size,
          color: 'green',
        )
      end
    end

    def render_food(state)
      extend Ruby2D::DSL

      food = state.food

      Circle.new(
        x: @pixel_size * food.col, y: @pixel_size * food.row,
        radius: @pixel_size / 2,
        color: 'yellow',
      )
    end
  end
end