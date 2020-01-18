require_relative "./environment.rb"
# require 'rest-client'
require 'pry'

class STRAND

    attr_accessor :name, :flavors, :effects

    @@strands_name_array = []
    @@flavors_array = []
    @@effects_array = []
    
    def initialize
        strands_hash = API.get_strands
        
    end
    
    def list_strands_name
        strands_array = API.get_strands.to_a[100..134] #shrink my hash to an array of 35 different strands
        strand_name = []
        strands_array.each.with_index(1) do |std, i| 
            strand_name << "#{i}. #{std[0]}"
        end
        puts strand_name
        # binding.pry
    end
        
    
    def self.all
        @@strands_name_array << self
    end



end
STRAND.new
