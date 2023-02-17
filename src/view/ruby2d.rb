require "ruby2d"

module View
  class Ruby2dView
    def initialize
      @pixel_size = 25
    end

    def start(state)
      extend Ruby2D::DSL
      grid = state.grid

      set(
        title: "Snake",
        width: @pixel_size * grid.cols,
        height: @pixel_size * grid.cols
      )

      show
    end

    def render_objects(state)
      extend Ruby2D::DSL

      clear
      render_snake(state)
      render_food(state)
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
      radius_circle = @pixel_size / 2

      Circle.new(
        x: (@pixel_size * food.col) + radius_circle, y: (@pixel_size * food.row) + radius_circle,
        radius: radius_circle,
        color: 'yellow',
      )
    end
  end
end