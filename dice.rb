### dice.rb

require "sinatra"
require "sinatra/reloader"

require "better_errors"
require "binding_of_caller"

use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  erb(:elephants)
end

get("/zebra") do
  "We must add a route for each path we want to support."
end

get("/giraffe") do
  "Hopefully this shows up without having to restart the server"
end

get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)

  sum = first_die + second_die

  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
  
  erb(:two_six)
end

get("/dice/2/10") do
  first_die = rand(1..10)
  second_die = rand(1..10)

  sum = first_die + second_die

  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

  erb(:two_ten)
end


get("/dice/3/20") do
  dice_rolls = [rand(1..20), rand(1..20), rand(1..20)]

  sum = dice_rolls.sum

  @outcome = "You rolled a #{dice_rolls[0]}, a #{dice_rolls[1]}, and a #{dice_rolls[2]} for a total of #{sum}."
  erb(:three_twenty)

end

#get("/bug") do
