require 'rspec'
require './lib/book'

RSpec.describe Book do
  let(:book) {Book.new({author_first_name: 'Harper',
                        author_last_name: 'Lee',
                        title: 'To Kill a Mockingbird',
                        publication_date: 'July 11, 1960'
                        })}
  
  it "is an instance of its class" do
    expect(book).to be_a Book
  end
  
  it "has attributes" do
    expect(book.title).to eq('To Kill a Mockingbird')
  end
  
  it "#author method returns full name" do
    expect(book.author).to eq('Harper Lee')
  end
  
  it "#publication_year returns the publication year" do
    expect(book.publication_year).to eq('1960')
  end
end
