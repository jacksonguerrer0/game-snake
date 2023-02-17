require "ruby2d"

module View
  class Ruby2dView
    def initialize(app)
      @pixel_size = 25
      @app = app
    end

    def start(state)
      extend Ruby2D::DSL
      grid = state.grid

      set(
        title: "Snake",
        width: @pixel_size * grid.cols,
        height: @pixel_size * grid.cols
      )

      on :key_down do |event|
        handle_key_event(state,event)
      end

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
          z: 10
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

    def handle_key_event(state, event)
      case event.key
      when 'up'
        @app.send_action(:change_direction, Model::Direction::UP)
        # Actions::change_direction(state, Model::Direction::UP)
      when 'down'
        @app.send_action(:change_direction, Model::Direction::DOWN)
        # Actions::change_direction(state, Model::Direction::DOWN)
      when 'left'
        @app.send_action(:change_direction, Model::Direction::LEFT)
        # Actions::change_direction(state, Model::Direction::LEFT)
      when 'right'
        @app.send_action(:change_direction, Model::Direction::RIGHT)
        # Actions::change_direction(state, Model::Direction::RIGHT)
      end
    end
  end
end