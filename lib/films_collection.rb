class FilmsCollections
  def initialize(films = [])
    @films = films
  end

  def films_director
    @films.map(&:director).sort.uniq
  end

  def input_check(choice)
    @films.select { |film| film.director == films_director[choice] }
  end

  def to_s_films_director
    films_director.map.with_index(1) { |director, index| "#{index}: #{director}" }.join("\n")
  end

  def director_index
    films_director.map.each_with_index { |_dir, index| index }
  end
end
