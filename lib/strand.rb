class Strand

    @@all = []
    
    attr_accessor :name, :race, :flavors, :effects
    
    def initialize(strand_attr)
        
        strand_attr.each do |std, info|
            self.send("#{std}=", info) if self.respond_to?("#{std}=")
            # binding.pry
        end
        self.save 
        @@all
    end
    
    
    def save
        @@all << self
    end
    
    def self.all #method to call all Strands
        @@all
    end
end