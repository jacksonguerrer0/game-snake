require_relative "view/ruby2d"
require_relative "model/state"

view = View::Ruby2dView.new

initial_state = Model::initialize_state
view.render(initial_state)