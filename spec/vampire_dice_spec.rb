require "vampire_dice"

RSpec.describe VampireDice do
  
  describe "#sides" do
    it "has ten sides" do
      dice = VampireDice.new
      expect(dice.sides).to eq(10)
    end 
  end

  describe "#roll" do
    it "lands between one and ten inclusive" do
      dice = VampireDice.new
      expect(1..10).to include(dice.roll)
    end
  end

  describe "#result" do
    context "when dice roll is between one and five inclusive" do
      it "is a failure" do
        dice = VampireDice.new
        allow(dice).to receive(:roll) { rand(1..5) }
        expect(dice.result).to eq("FAILURE")
      end
    end

    context "when dice roll is between 6 and 9 inclusive" do
      it "is a success" do
        dice = VampireDice.new
        allow(dice).to receive(:roll) { rand(6..9) }
        expect(dice.result).to eq("SUCCESS")
      end
    end

    context "when dice roll is 10" do
      it "is a critical success" do
        dice = VampireDice.new
        allow(dice).to receive(:roll) { 10 }
        expect(dice.result).to eq("CRITICAL SUCCESS")
      end
    end
  end
end