require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

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
  message = check_guess(guess, SECRET_NUMBER)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message }
end
