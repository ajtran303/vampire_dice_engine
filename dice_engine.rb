require 'sinatra'

require './lib/dice'
require './lib/hunger_dice'
require './lib/vampire_dice'

class Sinatra::Application
  get '/' do
    erb :index
  end

  get '/results/' do
    erb :results
  end

  post '/results/' do
    vampire_dice = params[:vampire_dice].to_i
    hunger_rolls = params[:hunger_dice].to_i

    results = Hash.new(0)

    vampire_rolls = vampire_dice - hunger_rolls
    vampire_rolls.times { results[VampireDice.new.result] += 1 }

    hunger_rolls.times { results[HungerDice.new.result] += 1 }

    erb :results, :locals => {'results' => results}
  end
end
