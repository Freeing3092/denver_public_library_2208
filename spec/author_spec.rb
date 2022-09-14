require 'rspec'
require './lib/book'
require './lib/author'

RSpec.describe Author do
  let(:charlotte_bronte) {Author.new({first_name: "Charlotte", 
                                      last_name: "Bronte"})}
                                      
  it "is an instance of its class" do
    expect(charlotte_bronte).to be_a Author
  end
  
  it "has readable attributes" do
    expect(charlotte_bronte.name).to eq("Charlotte Bronte")
    expect(charlotte_bronte.books).to eq([])
  end
  
  it "#write adds a book" do
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    expect(jane_eyre).to be_a Book
    expect(jane_eyre.title).to eq("Jane Eyre")
    
    villette = charlotte_bronte.write("Villette", "1853")
    result = [jane_eyre, villette]
    
    expect(charlotte_bronte.books).to eq(result)
  end
end
