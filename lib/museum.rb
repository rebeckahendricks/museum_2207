class Museum
  attr_reader :name, :exhibits, :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    recommended_exhibits = []
    patron.interests.each do |interest|
      @exhibits.each do |exhibit|
        recommended_exhibits << exhibit if exhibit.name == interest
      end
    end
    recommended_exhibits
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit
    hash = {}
    @exhibits.each do |exhibit|
      @patrons.each do |patron|
        if hash[exhibit]
          hash[exhibit] << patron if patron.interests.include?(exhibit.name)
        else
          hash[exhibit] = []
          hash[exhibit] << patron if patron.interests.include?(exhibit.name)
        end
      end
    end
    hash
  end

  def ticket_lottery_contestants(exhibit)
    array = []
    @patrons.each do |patron|
      array << patron if patron.spending_money < exhibit.cost
    end
    array
  end

  def draw_lottery_winner(exhibit)
    ticket_lottery_contestants(exhibit).sample
  end

  def announce_lottery_winner(exhibit)
    if draw_lottery_winner(exhibit)
      "#{draw_lottery_winner(exhibit).name} has won the #{exhibit.name} lottery"
    else
      "No winners for this lottery"
    end
  end
end
