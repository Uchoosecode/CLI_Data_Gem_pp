require_relative "./environment.rb"

class API 

    BASE_URL = "http://strainapi.evanbusse.com/#{ENV['TOKEN']}"
    STRANDS_URL = "#{BASE_URL}/strains/search/all" #returns the info for 1970 different strands of cannabis
    FLAVORS_URL = "#{BASE_URL}/searchdata/flavors" #returns all the different flavors for each strand
    EFFECTS_URL = "#{BASE_URL}/searchdata/effects" #returns all the effects for each strand
    
    def self.get_strands
            strands = RestClient.get("#{STRANDS_URL}") #opens the strands url
            strands_hash = JSON.parse(strands.body) #parses the info into a hash
        end
        
        def self.get_flavors
            flavors = RestClient.get("#{FLAVORS_URL}") #return info of all the flavors
            flavors_array = JSON.parse(flavors.body) #parses an array of the flavors
        end
        
        def self.get_effects
            effects = RestClient.get("#{EFFECTS_URL}")
            effects_array = JSON.parse(effects)
        end
    
end
API.get_strands

# Server-side applications must pass two parameters in addition to the apikey parameter:

# ts - a timestamp (or other long string which can change on a request-by-request basis)
# hash - a md5 digest of the ts parameter, your private key and your public key (e.g. md5(ts+privateKey+publicKey)
# For example, a user with a public key of "1234" and a private key of "abcd" could construct a valid call 
# as follows: http://gateway.marvel.com/v1/public/comics?ts=1&apikey=1234&hash=ffd275c5130566a2916217b101f26150 
# (the hash value is the md5 digest of 1abcd1234)