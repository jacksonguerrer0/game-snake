require_relative "view/ruby2d"
require_relative "model/state"
require_relative "actions/actions"

class App
  def initialize
    @state = Model::initialize_state
    @view = View::Ruby2dView.new(self)
  end

  def start
    Thread.new { init_timer(@view) }
    @view.start(@state)
  end

  def init_timer(view)
    loop do
      @state = Actions::move_snake(@state)
      view.render_objects(@state)
      sleep 0.5
    end

  end

  def send_action(actions, params)
    new_state = Actions.send(actions, @state, params)

    if new_state.hash != @state
      @state = new_state
      @view.render_objects(@state)
    end
  end
end

app = App.new
app.start