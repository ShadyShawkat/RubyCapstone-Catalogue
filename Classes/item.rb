require 'date'

class Item
  attr_accessor :publish_date
  attr_reader :id, :genre, :author, :label, :archived

  def initialize(publish_date, id = nil)
    @id = id || Random.rand(1..1_000_000)
    @publish_date = publish_date
    @archived = false
  end

  def add_genre(genre)
    @genre = genre
    genre.add_item(self) unless genre.items.include?(self)
  end

  def add_author(author)
    @author = author
    author.add_item(self) unless author.items.include?(self)
  end

  def add_label(label)
    @label = label
    label.add_item(self) unless label.items.include?(self)
  end

  def can_be_archived?
    DateTime.now.year - Date.parse(publish_date).year > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
