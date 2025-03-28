module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        films = array.map do |film|
          film['rating_kinopoisk'].to_f if film['rating_kinopoisk'].to_f.positive? &&
                                           film['country'] && film['country'].split(',').size >= 2
        end

        films = films.compact
        films.reduce(0.0, &:+) / films.size
      end

      def chars_count(films, threshold)
        films.map { |film| film['name'].count('и') if film['rating_kinopoisk'].to_f >= threshold }.compact.reduce(0, &:+)
      end
    end
  end
end
