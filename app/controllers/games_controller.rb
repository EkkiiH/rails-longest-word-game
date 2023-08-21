require 'open-uri'
class GamesController < ApplicationController

  def new
    session[:letters] = (0...9).map { ('a'..'z').to_a[rand(26)] }
    @letters = session[:letters]

    # raise
  end

  def score
    # fetch API
    @word = params[:word]
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    response = URI.open(url)
    json = JSON.parse(response.read)
    word_exist = json['found']
    # word does exist on API ?

    # # Retrieve @letters from the new action
    array_letters = []
    array_letters = session[:letters]
    
    # # Check if the word is composed of letters from @letters
# raise

    # does @word is composed of letters from @letters?
    # split letters from @word into an array
    array_word = []
    array_word << @word.chars
    to_check = array_word[0]
    @compare = []
    # check that the characters from @word are same as @letter array
    @compare = to_check & array_letters
    if @compare == array_word.flatten && word_exist == false
    # The word exists in the dictionary, but it's not valid
      @result = "Sorry, #{@word} is not an english word."
    elsif @compare == array_word.flatten
      # You win with a valid word
      # @result = "win"
      @result = "You win with the word #{@word}!"
    else
      # The word doesn't exist in the dictionary
      @result = "Sorry, but #{@word} can't be built out of #{array_letters.join}."
    end
    # raise

  end
end
