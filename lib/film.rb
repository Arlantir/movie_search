class Film
  attr_reader :title, :director, :year

  def initialize(params)
    @title    = params[:title]
    @director = params[:director]
    @year     = params[:year]
    @genre    = params[:genre]
    @place    = params[:place]
  end

  def to_s
    "#{@director} - #{@title} (#{@genre}) #{@year} - рейтинг по версии IMDb: #{@place}"
  end
end
