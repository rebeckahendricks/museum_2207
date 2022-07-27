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

end
