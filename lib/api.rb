require_relative "./environment.rb"

class API 

    BASE_URL = "http://strainapi.evanbusse.com/#{ENV['TOKEN']}"
    STRANDS_URL = "#{BASE_URL}/strains/search/all" #returns the info for 1970 different strands of cannabis
    
    def self.get_strands
            strands = RestClient.get("#{STRANDS_URL}") #opens the strands url
            strands_hash = JSON.parse(strands.body) #parses the info into a hash
    end
end