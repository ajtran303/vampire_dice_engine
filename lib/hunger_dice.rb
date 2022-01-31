class HungerDice < Dice
  def initialize
    super(10)
  end

  def result
    case roll
    when 1 then "BESTIAL FAILURE"
    when 2..5 then "FAILURE"
    when 6..9 then "SUCCESS"
    else "MESSY CRITICAL"
    end
  end
end