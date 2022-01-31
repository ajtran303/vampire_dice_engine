class Dice
  attr_reader :sides, :roll

  def initialize(sides)
    @sides = sides
    @roll = get_roll
  end

  private

  def get_roll
    rand(1..sides)
  end
end