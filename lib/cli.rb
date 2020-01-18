# require_relative "./api.rb"
require_relative "./environment.rb"

class CLI 
   
    def initialize
        start

    end
    
    def start
        puts "Welcome to The Cannabis Api"
        main_menu_options
    end
    
    def main_menu_options
        puts "Type '1' to list strands by name..."
        puts "Type '2' to list strands by flavors..."
        puts "Type '3' to list strands by effects..."
        puts "Type '0' to exit"
        # binding.pry
        main_menu_input
    end
    
    def main_menu_input
        user_input = gets.strip
        
        if user_input == '1'
            puts "Here are the strands by name..."
            STRAND.new.list_strands_name
            s_name_sub_menu_options

        elsif user_input == '2'
            puts "Strands by flavors"
                s_flavors_sub_menu_options

        elsif user_input == '3'
            puts "Strands by effect"
                s_effects_sub_menu_options

        elsif user_input == '0'
            puts "Thank You for stopping by!!!"
            goodbye

        else 
            puts "Not an option pick again please...."
            main_menu_options
        end

    end


    def s_name_sub_menu_options
        puts "Type the number for the strand you want"
        s_name_sub_user_input
    end

    def s_flavors_sub_menu_options
        puts "Type the number for the flavor you want"
        s_flavors_sub_user_input
    end

    def s_effects_sub_menu_options
        puts "Type the number for the effects you'd like to experience"
        s_effects_sub_user_input
    end

    def s_name_sub_user_input
        user_input = gets.strip
        
        if user_input == "#{i}"
            puts "strand info hash"
            ss_menu_options 
        
        else
            puts "Not an option pick again please...."
            s_name_sub_menu_options
        end
    end

    def s_flavors_sub_user_input
        user_input = gets.strip
        
        if user_input == "#{i}"
            puts "strand info array"
            ss_menu_options 
        
        else
            puts "Not an option pick again please...."
            s_name_sub_menu_options
        end
    end

    def s_effects_sub_user_input
        user_input = gets.strip
        
        if user_input == "#{i}"
            puts "strand info array"
            ss_menu_options 
        
        else
            puts "Not an option pick again please...."
            s_name_sub_menu_options
        end
    end

    def ss_menu_options
        puts "Type '1' to go back list of names..."
        puts "Type '2' to list strands by flavors..."
        puts "Type '3' to list strands by effects..."
        puts "Type '0' to exit"
        ss_menu_user_input
    end

    def ss_menu_user_input
        user_input = gets.strip
        
        if user_input == '1'
            puts "Here are the strands by name..."
            API.get_strands
            s_name_sub_menu_options

        elsif user_input == '2'
            puts "Strands by flavors"
                s_flavors_sub_menu_options

        elsif user_input == '3'
            puts "Strands by effect"
                s_effects_sub_menu_options

        elsif user_input == '0'
            puts "Thank You for stopping by!!!"
            goodbye

        else 
            puts "Not an option pick again please...."
            main_menu_options
        end

    end
    
    def goodbye
        exit
    end

end

# puts "Grabbing you some strands, please hold..."