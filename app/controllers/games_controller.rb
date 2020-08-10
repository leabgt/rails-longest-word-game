require 'open-uri'

class GamesController < ApplicationController

  def new
    @letters = [*'A'..'Z'].sample(10)
  end

  def score
    @word = params[:word].upcase
    @word_letters = @word.split(//)
    @letters = params[:letters].split(//)

    @url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    @english_words = JSON.parse(open(@url).read)
  end

end
