class API 

    BASE_URL = "http://strainapi.evanbusse.com/#{ENV['TOKEN']}"
    STRANDS_URL = "#{BASE_URL}/strains/search/all" #returns the info for 1970 different strands of cannabis
    
    def self.get_strands
        strands = RestClient.get("#{STRANDS_URL}") #opens the strands url
        strands_hash = JSON.parse(strands.body) #parses the info into a hash
             info_hash = {}
        strands_hash.each do |strand, info|  #creates a variable of Strands in a hash
            
            info_hash[:name] = strand
            info_hash[:race] = info["race"]
            info_hash[:flavors] = info["flavors"]
            info_hash[:effects] = info["effects"]
            Strand.new(info_hash)
        end
    end
end