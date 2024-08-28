require 'gosu'

module Clickable
  def handle_click
    @_clicked = Gosu.button_down?(Gosu::MS_LEFT) && mouse_over?
  end

  def mouse_position(opt)
    @mouse_x = opt.has_key?(:mx) ? opt[:mx] : 0
    @mouse_y = opt.has_key?(:my) ? opt[:my] : 0
  end

  def mouse_over?
    raise NotImplementedError
  end

  def clicked?
    @_clicked
  end
end
