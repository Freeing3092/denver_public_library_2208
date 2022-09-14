require 'rspec'
require './lib/book'
require './lib/author'
require './lib/library'

RSpec.describe Library do
  let(:dpl) {Library.new('Denver Public Library')}
  let(:charlotte_bronte) {Author.new({first_name: "Charlotte", 
                                      last_name: "Bronte"})}
  let(:harper_lee) {Author.new({first_name: "Harper", 
                                      last_name: "Lee"})}
  before(:each) do
  end
  
  it "is an instance of its class" do
    expect(dpl).to be_a Library
  end
  
  it "has readable attributes" do
    expect(dpl.name).to eq('Denver Public Library')
    expect(dpl.books).to eq([])
    expect(dpl.authors).to eq([])
    expect(dpl.checked_out_books).to eq([])
    expect(dpl.books_with_checkout_count).to eq({})
  end
  
  it "#add_author method adds authors and books to attributes" do
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)
    
    author_result = [charlotte_bronte, harper_lee]
    book_result = [jane_eyre, professor, villette, mockingbird]
    expect(dpl.authors).to eq(author_result)
    expect(dpl.books).to eq(book_result)
  end
  
  it "#publication_time_frame_for returns hash" do
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)
    result = {start: '1847', end: '1857'}
    expect(dpl.publication_time_frame_for(charlotte_bronte)).to eq(result)
    
    result = {start: '1960', end: '1960'}
    expect(dpl.publication_time_frame_for(harper_lee)).to eq(result)
  end
  
  it "checkout returns boolean value" do
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
    expect(dpl.checkout(mockingbird)).to eq(false)
    expect(dpl.checkout(jane_eyre)).to eq(false)
    
    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)
    
    # Book checkout
    expect(dpl.checkout(jane_eyre)).to eq(true)
    expect(dpl.checked_out_books).to eq([jane_eyre])
    expect(dpl.checkout(jane_eyre)).to eq(false)
  end
  
  it "#return book returns a book" do
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)
    
    dpl.checkout(jane_eyre)
    # Book return
    dpl.return(jane_eyre)
    expect(dpl.checked_out_books).to eq([])
    
  end
  
  it "#most_popular_book returns the books checked out the most" do
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)
    
    dpl.checkout(jane_eyre)
    dpl.checkout(villette)
    dpl.checkout(mockingbird)
    dpl.return(mockingbird)
    dpl.checkout(mockingbird)
    dpl.return(mockingbird)
    dpl.checkout(mockingbird)
    expect(dpl.most_popular_book).to eq(mockingbird)
  end
end  













