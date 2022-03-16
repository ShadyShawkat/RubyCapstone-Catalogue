require 'json'
require_relative './genre'

class GenreData
  def self.path
    './Data/genre.json'
  end

  def self.read_data
    return nil unless File.exist?(GenreData.path)

    result = []
    result = JSON.parse(File.read(GenreData.path)) unless File.read(GenreData.path) == ''
    result.map do |response|
      Genre.new(response['name'], response['id'])
    end
  end

  def self.save_data(genres)
    new_genres = genres.map do |genre|
      {
        name: genre.name,
        id: genre.id,
      }
    end
    File.write(GenreData.path, JSON.generate(new_genres))
  end
end
