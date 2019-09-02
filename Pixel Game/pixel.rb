require 'ruby2d'

set width: 500

set height: 500

set background: Image.new('Images/umm.png', width: 500, height: 500,)

set fps_cap: 12

set title: '8 Bit Game'

@sprite_x = 100
@sprite_y = 325
@x_speed = 0
@y_speed = 0
@score = -1
@circle_x = 200
@circle_y = 100
@ability = false
@finished = false
@sc = Sound.new('Music/coin.wav')
@sf = Sound.new('Music/finished.wav')
@bm = Music.new('Music/background.mp3')

@bm.loop = true

@bm.volume = 75

@bm.play

@sprite = Sprite.new(
  'Images/sprite.png', clip_width: 110, width: 30, height: 45, time: 300, animations:
   {rest: 0..0,
    walk: 1..4,
    front: 5..7,
    back: 8..10}, x: 100, y: 300,)

@wizard = Image.new('Images/wizard.png', width: 35, height: 40, x: 0, y: 308)

@coin = Sprite.new('Images/coin.png', clip_width: 202, time: 150,loop: true, width: 20, height: 30,  x: 106, y: 306,)


    on :key_down do |event|
      case event.key
        when 'a'
          @sprite.play animation: :walk, loop: true
          @x_speed = -25
          @y_speed = 0
        when 'd'
          @sprite.play animation: :walk, loop: true, flip: :horizontal
          @x_speed = 25
          @y_speed = 0
        when 'w'
          @sprite.play animation: :back, loop: true
          @x_speed = 0
          @y_speed = -25
        when 's'
          @sprite.play animation: :front, loop: true
          @x_speed = 0
          @y_speed = 25
      end
    end

    on :key_up do |event|
      case event.key
        when 'a'
          @sprite.play animation: :rest, loop: true
          @x_speed = 0
          @y_speed = 0
        when 'd'
          @sprite.play animation: :rest, loop: true
          @x_speed = 0
          @y_speed = 0
        when 'w'
          @sprite.play animation: :rest, loop: true
          @x_speed = 0
          @y_speed = 0
        when 's'
          @sprite.play animation: :rest, loop: true
          @x_speed = 0
          @y_speed = 0
      end
    end

@text = Text.new("COINS: #{@score}", color: 'white', font: 'assets/PressStart2P.ttf', size: 15)

@dialog = Text.new("MISSION: GIVE THE WIZARD 20 COINS",  font: 'assets/PressStart2P.ttf', size: 15, y: 30)

update do
  @sprite.x += @x_speed
  @sprite.y += @y_speed

  if @sprite.y <= 225
    @sprite_y = 250
    @sprite.y = @sprite_y
@sprite.play animation: :rest, loop: true
  end

  if @sprite.x <= 0
    @sprite_x = 25
    @sprite.x = @sprite_x
    @sprite.play animation: :rest, loop: true
  end

  if @sprite.x >= 475
    @sprite_x = 450
    @sprite.x = @sprite_x
    @sprite.play animation: :rest, loop: true
  end

  if @sprite.y >= 475
    @sprite_y = 450
    @sprite.y = @sprite_y
    @sprite.play animation: :rest, loop: true
  end

  @coin.play
if @ability == false
  if @sprite.x == 25
    if @sprite.y == 300
      @dialog.remove
      if @score >= 20
        @sf.play
        @score -= 20
        @text.remove
        @text = Text.new('COLLECT 20 MORE COINS.', color: 'white', font: 'assets/PressStart2P.ttf', size: 15,)
        @dialog = Text.new('ABILITY UNLOCKED. USE ARROW KEYS.', font: 'assets/PressStart2P.ttf', size: 15, y: 30)
        @ability = true
         if @ability == true
           @dialog = Text.new('ABILITY UNLOCKED. USE ARROW KEYS.', font: 'assets/PressStart2P.ttf', size: 15, y: 30)
        end
      end
    end
  end
end

if @ability == true
  if @sprite.x == 25
    if @sprite.y == 300
      @dialog.remove
        if @score >= 20
          @sf.play
          @score -= 20
          @text.remove
          @text = Text.new('CLICK R TO FINISH.', color: 'white', font: 'assets/PressStart2P.ttf', size: 15,)
          @finished = true
        end
    end
  end
end
  @final = @sprite.x + 6

  @final2 = @sprite.y + 6

  if @coin.x == @final
       if @coin.y == @final2
         @sc.play
         @score += 1
         @text.remove
         @text = Text.new("COINS: #{@score}", color: 'white', font: 'assets/PressStart2P.ttf', size: 15,)
         @value_x = rand(17)
         @value_y = rand(7)
         @coin_x = @value_x * 25
         @coin_y = @value_y * 25
       end
   end

   @coin.x = @coin_x + 31
   @coin.y = @coin_y + 306

   if @ability == true
     on :key_down do |event|
       case event.key
       when 'left'
           @sprite.play animation: :walk, loop: true
           @x_speed = -50
           @y_speed = 0
         when 'right'
           @sprite.play animation: :walk, loop: true, flip: :horizontal
           @x_speed = 50
           @y_speed = 0
         when 'up'
           @sprite.play animation: :back, loop: true
           @x_speed = 0
           @y_speed = -50
         when 'down'
           @sprite.play animation: :front, loop: true
           @x_speed = 0
           @y_speed = 50
       end
     end

     on :key_up do |event|
       case event.key
       when 'left'
           @sprite.play animation: :rest, loop: true
           @x_speed = 0
           @y_speed = 0
         when 'right'
           @sprite.play animation: :rest, loop: true
           @x_speed = 0
           @y_speed = 0
         when 'up'
           @sprite.play animation: :rest, loop: true
           @x_speed = 0
           @y_speed = 0
         when 'down'
           @sprite.play animation: :rest, loop: true
           @x_speed = 0
           @y_speed = 0
       end
     end
   end

   if @finished == true
     on :key_up do |event|
       case event.key
       when 'r'
         Image.new('Images/finished.png', clip_width: 107, time: 150, loop: true, width: 500, height: 500)
         @bm.fadeout(5000)
         @wizard.remove
         @sprite.remove
         @coin.remove
        end
     end
   end
end

show
