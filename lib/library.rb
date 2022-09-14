class Library
  attr_reader :name, :books, :authors
  
  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end
  
  def add_author(author)
    @authors << author
    author.books.each do |book|
      @books << book
    end
  end
  
  def publication_time_frame_for(author)
    books_array = []
    author.books.each do |book|
      books_array << book.publication_year
    end
    {start: books_array.sort.first,
    end: books_array.sort.last}
  end
end