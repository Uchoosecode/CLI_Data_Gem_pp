require_relative "./environment.rb"
require 'pry'

class Strand

    attr_accessor :name

    @@strands_arrany = []
    @@flavors_array = []
    @@effects_array = []


    strands_hash = API.gets_strands
    binding.pry

    def initialize(hash)
        strands_array = strands_hash.to_a[100..134] #shrink my hash to an array of 35 different strands

        strand_name = []
            strands_array.each.with_index(1) do |std, i| 
                strand_name << "#{i}. #{std[0]}"
            end
            puts strand_name
    end

    def list_strands
        
        API.gets_strands[0][0]
    end

    def self.all
        @@strands_arrany << self
    end



end

