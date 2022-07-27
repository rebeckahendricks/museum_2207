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

end
