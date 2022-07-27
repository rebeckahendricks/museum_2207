require './lib/exhibit'
require './lib/patron'

describe Patron do
  xit 'is an instance of Patron' do
    patron_1 = Patron.new("Bob", 20)

    expect(patron_1).to be_instance_of(Patron)
  end

  xit 'has a name' do
    patron_1 = Patron.new("Bob", 20)

    expect(patron_1.name).to eq("Bob")
  end

  xit 'it has spending money' do
    patron_1 = Patron.new("Bob", 20)

    expect(patron_1.spending_money).to eq(20)
  end

  xit 'it has no interests by default' do
    patron_1 = Patron.new("Bob", 20)

    expect(patron_1.interests).to eq([])
  end

  xit 'can add interests' do
    patron_1 = Patron.new("Bob", 20)

    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")

    expect(patron_1.interests).to eq(["Dead Sea Scrolls", "Gems and Minerals"])
  end
end
