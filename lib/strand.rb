require_relative "./environment.rb"
# require 'rest-client'
require 'pry'

class STRAND

    attr_accessor 
    attr_reader 

    @@all = []

    
    def initialize
        strands_hash = API.get_strands #shrink my hash to an array of 35 different strands
        
        strands_hash.each do |std, info| 
            @@all << ["#{std}=", info]
            # binding.pry
        end 
    end
    
    def self.all
        @@all
    end

end
STRAND.new
