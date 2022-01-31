require "hunger_dice"

RSpec.describe HungerDice do

  describe "#sides" do
    it "has ten sides" do
      dice = HungerDice.new
      expect(dice.sides).to eq(10)
    end 
  end

  describe "#roll" do
    it "lands between one and ten inclusive" do
      dice = HungerDice.new
      expect(1..10).to include(dice.roll)
    end
  end

  describe "#result" do
    context "when dice roll is one" do
      it "is a bestial failure" do
        dice = HungerDice.new
        allow(dice).to receive(:roll) { 1 }
        expect(dice.result).to eq("BESTIAL FAILURE")
      end
    end

    context "when dice roll between two and five" do
      it "is a failure" do
        dice = HungerDice.new
        allow(dice).to receive(:roll) { rand(2..5) }
        expect(dice.result).to eq("FAILURE")
      end
    end

    context "when dice roll between six and nine" do
      it "is a success" do
        dice = HungerDice.new
        allow(dice).to receive(:roll) { rand(6..9) }
        expect(dice.result).to eq("SUCCESS")
      end
    end

    context "when doce roll is ten" do
      it "is a messy critical" do
        dice = HungerDice.new
        allow(dice).to receive(:roll) { 10 }
        expect(dice.result).to eq("MESSY CRITICAL")
      end
    end
  end
end