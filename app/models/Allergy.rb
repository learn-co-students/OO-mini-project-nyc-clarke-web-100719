class Allergy

    attr_accessor :user, :ingredient
    @@all = []
    
    def self.all
        @@all
    end
    
    def initialize(user, ingredient)
      @user = user
      @ingredient = ingredient

      self.class.all << self
    end


end