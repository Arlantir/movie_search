require 'net/http'
require 'nokogiri'

require_relative 'lib/film'
require_relative 'lib/films_collection'
require_relative 'lib/films_parse'

collections = FilmsCollections.new(FilmsParse.parse_wiki)

puts 'Программа «Фильм на вечер»'
puts
puts collections.to_s_films_director

puts 'Фильм какого режиссера вы хотите сегодня посмотреть?'

until collections.director_index.include?(choice = STDIN.gets.to_i - 1)
  puts 'Вам нужно выбрать цифру из списка!'
end

recommended_film = collections.input_check(choice)

puts
puts "И сегодня вечером рекомендую посмотреть: #{recommended_film.sample}"
