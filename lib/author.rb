require './lib/book'

class Author
  attr_reader :name, :books
  
  def initialize(author_info)
    @name = author_info.values.join(' ')
    @books = []
  end
  
  def write(title, date)
    book_info = {author_first_name: self.name.split.first,
                author_last_name: self.name.split.last,
                title: title,
                publication_date: date}
    new_book = Book.new(book_info)
    @books << new_book
    new_book
  end
end