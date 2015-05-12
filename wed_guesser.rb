require 'sinatra'
require 'sinatra/reloader'

@@SECRET_NUMBER = rand(100)
@@counter = 5

def check_guess(guess, number)
  if guess == number
    return "You got it right!"
  elsif guess > number && (guess - number) > 5
    return "Way too high!"
  elsif guess > number
    return "Too High!"
  elsif guess < number && (number - guess) > 5
    return "Way too low!"
  else
    return "Too low!"
  end
end

get '/' do
  guess = params['guess'].to_i
  if guess == @@SECRET_NUMBER
    message = "Wow, you guessed it! Let's do another."
    @@SECRET_NUMBER = rand(100)
    @@counter = 5
  elsif @@counter > 1
    message = check_guess(guess, @@SECRET_NUMBER)
    @@counter -= 1
  else
    message = "I'm sorry, you've lost. A new number has been generated. Good luck!"
    @@SECRET_NUMBER = rand(100)
    @@counter = 5
  end
  erb :index, :locals => {:number => @@SECRET_NUMBER, :message => message }
end
