require_relative "./environment.rb"
require 'pry'

class STRAND

    @@all = []
    
    def initialize
        strands_hash = API.get_strands #creates a variable of Strands in a hash 
        
        strands_hash.each do |std, info| #iterates through each hash
            @@all << ["#{std}=", info]
        end 
    end
    
    def self.all #method to call all Strands
        @@all
    end
end
STRAND.new
