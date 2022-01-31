require "dice"

RSpec.describe Dice do
  
  describe "#sides" do
    context "given an amount of sides" do
      it "returns three sides" do
        dice = Dice.new(3)
        expect(dice.sides).to eq(3)
      end
      
      it "returns ten sides" do
        dice = Dice.new(10)
        expect(dice.sides).to eq(10)
      end
    end
  end

  describe "#roll" do
    context "when a dice is rolled" do
      it "lands on a range based on its sides" do
        dice = Dice.new(3)
        expect(1..3).to include(dice.roll)
      end

      it "lands on another range based on its sides" do
        dice = Dice.new(10)
        expect(1..10).to include(dice.roll)
      end
    end
  end
end