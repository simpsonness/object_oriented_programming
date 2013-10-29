class Rover
  DIRECTION = %w(N E S W)
  NORTH = 0
  EAST = 1
  SOUTH = 2
  WEST = 3

  def initialize(x, y, orientation)
    @x = x
    @y = y
    @orientation = DIRECTION.index(orientation)
  end

  
  end

  def left
    @orientation = (@orientation - 1) % 4
    self
  end

  def right
    @orientation = (@orientation + 1) % 4
    self
  end

  def move
    @y += 1 if @orientation == NORTH
    @x += 1 if @orientation == EAST
    @y -= 1 if @orientation == SOUTH
    @x -= 1 if @orientation == WEST
    self
  end

  def orientation
    DIRECTION[@orientation]
  end

  def position
    [@x, @y]

  end
end 