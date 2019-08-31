require 'ruby2d'

set background: '#2B3252'

set fps_cap: 12

set title: 'Square Game'

set width: 500

set height: 500

@square = Square.new(x: 87.5, y: 87.5, size: 25, color: '#800000')

@circle = Circle.new(x: 100, y: 100, radius: 10, color: '#fad744')

@score = 0
@circle_x = 200
@circle_y = 100
@square_x = 87.5
@square_y = 87.5
@x_speed = 0
@y_speed = 0

on :key_down do |event|
  if event.key == 'left'
    @x_speed = -25
    @y_speed = 0
  elsif event.key == 'right'
    @x_speed = 25
    @y_speed = 0
  elsif event.key == 'up'
    @x_speed = 0
    @y_speed = -25
  elsif event.key == 'down'
    @x_speed = 0
    @y_speed = 25
  elsif event.key == 'space'
    @x_speed = 0
    @y_speed = 0
  end
end

on :key_down do |event|
  if event.key == 'a'
    @x_speed = -25
    @y_speed = 0
  elsif event.key == 'd'
    @x_speed = 25
    @y_speed = 0
  elsif event.key == 'w'
    @x_speed = 0
    @y_speed = -25
  elsif event.key == 'a'
    @x_speed = 0
    @y_speed = 25
  end
end

on :key_down do |event|
  if event.key == 'a'
    @x_speed = -25
    @y_speed = 0
  elsif event.key == 'd'
    @x_speed = 25
    @y_speed = 0
  elsif event.key == 'w'
    @x_speed = 0
    @y_speed = -25
  elsif event.key == 's'
    @x_speed = 0
    @y_speed = 25
  end
end

on :key_up do |event|
  if event.key == 'a'
    @x_speed = 0
    @y_speed = 0
  elsif event.key == 'd'
    @x_speed = 0
    @y_speed = 0
  elsif event.key == 'w'
    @x_speed = 0
    @y_speed = 0
  elsif event.key == 's'
    @x_speed = 0
    @y_speed = 0
  end
end

@text = Text.new("Score: #{@score}", color: '#de1010')

update do
  @square.x += @x_speed
  @square.y += @y_speed

  @circle.x = @circle_x
  @circle.y = @circle_y

  @final = @square.x + 12.5

  @final2 = @square.y + 12.5

  if @circle.x == @final
     if @circle.y == @final2
       @score += 1
       @value_x = rand(18)+1
       @value_y = rand(18)+1
       @circle_x = @value_x * 25
       @circle_y = @value_y * 25
       @text.remove
       @text = Text.new("Score: #{@score}", color: '#de1010')
     end
  end

  if @square.x >= 475
    @square_x = 462.5
    @square.x = @square_x
  end

  if @square.y >= 475
    @square_y = 462.5
    @square.y = @square_y
  end

  if @square.x <= 0
    @square_x = 12.5
    @square.x = @square_x
  end

  if @square.y <= 0
    @square_y = 12.5
    @square.y = @square_y
  end

end

show
