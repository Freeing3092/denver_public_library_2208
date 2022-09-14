class Library
  attr_reader :name, 
              :books, 
              :authors, 
              :checked_out_books,
              :books_with_checkout_count
  
  def initialize(name)
    @name = name
    @books = []
    @authors = []
    @checked_out_books = []
    @books_with_checkout_count = Hash.new(0)
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
  
  def checkout(book)
    if @books.include?(book) && !@checked_out_books.include?(book)
      @checked_out_books << book
      @books_with_checkout_count[book] += 1
      true
    else
      false
    end
  end
  
  def return(book)
    @checked_out_books.select! do |checked_out_book|
      checked_out_book != book
    end
  end
  
  def most_popular_book
    most_checkout = @books_with_checkout_count.values.max
    @books_with_checkout_count.key(most_checkout)
    # @books_with_checkout_count.each do |book, count|
  end
end