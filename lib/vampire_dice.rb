class VampireDice < Dice
  def initialize
    super(10)
  end

  def result
    case roll
    when 1..5 then "FAILURE"
    when 6..9 then "SUCCESS"
    else
      "CRITICAL SUCCESS"
    end
  end
end