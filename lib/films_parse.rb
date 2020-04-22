class FilmsParse
  URL_WIKI = 'https://ru.wikipedia.org/wiki/250_%D0%BB%D1%83%D1%87%D1%88%D0%B8%D1%85_%D1%84%D0%B8%D0%BB%D1%8C%D0%BC%D0%BE%D0%B2_%D0%BF%D0%BE_%D0%B2%D0%B5%D1%80%D1%81%D0%B8%D0%B8_IMDb'

  def self.parse_wiki
    parsing_html_wiki[1..].map do |node|
      Film.new(
        place: node.css('td[1]/text()').to_s.strip,
        title: node.css('td[2]/a/text()').to_s.strip,
        year: node.css('td[3]/a/text()').to_s.strip,
        director: node.css('td[4]/a/text()').to_s.strip,
        genre: node.css('td[5]/a/text()').to_a.join(', ')
      )
    end
  end

  def self.parsing_html_wiki
    response = Net::HTTP.get_response(URI.parse(URL_WIKI))
    doc = Nokogiri::HTML(response.body)
    # соберем первые 50 фильмов
    doc.css('tbody/tr').take(50)
  end
end
