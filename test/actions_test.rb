require "minitest/autorun"
require_relative "../src/actions/actions.rb"
require_relative "../src/model/state"

class ActionTest < Minitest::Test
  def test_move_snake
    puts 'ru test'

    initial_state = Model::State.new(
      Model::Snake.new([
        Model::Coord.new(1,1),
        Model::Coord.new(0,1)
      ]),
      Model::Food.new(0, 4),
      Model::Grid.new(60, 40),
      Model::Direction::DOWN,
      false
    )

    expected_state = Model::State.new(
      Model::Snake.new([
        Model::Coord.new(2,1),
        Model::Coord.new(1,1)
      ]),
      Model::Food.new(0, 4),
      Model::Grid.new(60, 40),
      Model::Direction::DOWN,
      false
    )

    currently_state = Actions::move_snake(initial_state)

    assert_equal currently_state, expected_state
  end
end