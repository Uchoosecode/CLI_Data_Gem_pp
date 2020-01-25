class CLI 

    @@input = [] #create a class array thats saves the user's input

    def initialize
        start
    end
    
    def start
        puts "Welcome to The Cannabis Api"
        puts "Grabbing your list of Strands"
        puts "Please hold..."
        list_all_strands_name #listing all the Strands as soon as the Gem starts
        main_menu_options #options to choose the Strand or exit
    end
    
    def list_all_strands_name #method that creates the initial Strand list
        Strand.all.each.with_index(1) do |strand, i|
            puts "#{i}. #{strand.name}"
        end
    end
    
    def list_strands_info #method that is used to access the information of each Strand
        info_array = []
        Strand.all.each do |info|
            info_array << info
        end
        info_array #returns an array of all a hash with the keys being the different options
    end

    def main_menu_options
        puts "Enter the number for the Strand you want..."
        puts "Type '0' to exit"
        main_menu_input
    end
    
    def main_menu_input
        user_input = gets.strip
        save_input << user_input.to_i #pushes the user's input into the class array
        
        if user_input.to_i.between?(1, Strand.all.length) #only accepts the user's input between this range
            puts "Strand Name"
            puts "  "  #just space to make it more presentable in the terminal
            puts list_strands_info[user_input.to_i-1].name
            puts "  "
            s_name_sub_menu_options
            
        elsif user_input == '0'
            puts "Thank You for stopping by!!!"
            goodbye #method to exit
            
        else  #prevents the user to be anything outside of our range arguments
            puts "Not an option pick again please...."
            puts "  "
            main_menu_options
        end
    end
    
    def save_input #method to call the class array
        @@input
    end
    
    def s_name_sub_menu_options #method for options after the initial list
        puts "Enter '1' for flavors of this Strand..."
        puts "Enter '2' for list of effects for this Strand..."
        puts "Enter '3' for the race of this Strand..."
        puts "Enter '4' to list name of Strands..." #options to re-list all the Strands
        puts "Enter '0' to exit..."
        s_name_sub_user_input
    end    
    
    def effects_options  #the effects get a different menu from the other attributes
        puts "Here are the effects options for this Strand..."
        puts "Enter '1' for the Positive effects..."
        puts "Enter '2' for the Negative effects..."
        puts "Enter '3' for the Medical effects..."
        puts "Enter '4' for the name of this Strand..."
        puts "Enter '5' to list the flavors for this Strand..."
        puts "Enter '6' for list of Strands"
        puts "Enter '0' to exit"
        effects_options_input
    end
    
    def s_name_sub_user_input #input for the s_name_sub_menu_options
        user_input = gets.strip
        
        if user_input == '1'
            puts "Strand Flavors"
            puts "  "
            puts list_strands_info[save_input.at(0)].flavors #the .at method give us access to the value of the class array      
            puts "  "
            ss_flavor_options
            
        elsif user_input == '2'
            effects_options #special options for the effects
            
        elsif user_input == '3'
            puts "Strand Race"
            puts "  "
            puts list_strands_info[save_input.at(0)].race
            puts "  "
            ss_race_options
            
        elsif user_input == '4'
            puts list_all_strands_name 
            main_menu_input
            
        elsif user_input == '0'
            goodbye
            
        else
            puts "Not an option pick again please...."
            s_name_sub_menu_options
        end
    end

    def effects_options_input #input for the effects_options
        user_input = gets.strip

            if user_input == '1'
                puts "Positive Effects"
                puts "  "
                puts list_strands_info[save_input.at(0)].effects["positive"]
                puts "  "
                effects_options

            elsif user_input == '2'
                puts "Negative Effects"
                puts "  "
                puts list_strands_info[save_input.at(0)].effects["negative"]
                puts "  "
                effects_options

            elsif user_input == '3'
                puts "Medical Effects"
                puts "  "
                puts list_strands_info[save_input.at(0)].effects["medical"]
                puts "  "
                effects_options

            elsif user_input == '4'
                puts "Strand Name"
                puts "  "
                puts list_strands_info[save_input.at(0)].name
                puts "  "
                s_name_sub_menu_options

            elsif user_input == '5'
                puts "Strand Flavors"
                puts "  "
                puts list_strands_info[save_input.at(0)].flavors
                puts "  "
                ss_flavor_options

            elsif user_input == '6'
                list_all_strands_name
                puts "Here are the strands by name..."
                puts "  "
                main_menu_options

            elsif user_input == '0'
                goodbye

            else
                puts "Not an option pick again please...."
                main_menu_options
            end
    end

    def ss_flavor_options
        puts "Type '1' to list Strands by names..."
        puts "Type '2' to list the effects of this Strand..."
        puts "Type '3' to race of this Strand..."
        puts "Type '0' to exit"
        ss_flavor_user_input
    end

    def ss_effects_options
        puts "Type '1' to list Strands by names..."
        puts "Type '2' to list flavors of this Strand..."
        puts "Type '3' to list race of this Strand..."
        puts "Type '0' to exit"
        ss_effects_user_input
    end

    def ss_race_options
        puts "Type '1' to list Strands by names..."
        puts "Type '2' to list flavors of this Strand..."
        puts "Type '3' to list effects of this Strand..."
        puts "Type '0' to exit"
        ss_race_user_input
    end
       
    def ss_flavor_user_input
        user_input = gets.strip
        
        if user_input == '1'
            list_all_strands_name
            puts "Here are the strands by name..."
            main_menu_options

        elsif user_input == '2'
            effects_options

        elsif user_input == '3'
            puts "Strand Race"
            puts "  "
            puts list_strands_info[save_input.at(0)].race
            puts "  "
            ss_race_options

        elsif user_input == '0'
            puts "Thank You for stopping by!!!"
            goodbye

        else 
            puts "Not an option pick again please...."
            main_menu_options
        end
    end
    
    def ss_effects_user_input
        user_input = gets.strip
        
        if user_input == '1'
            list_all_strands_name
            puts "Here are the strands by name..."
            main_menu_options

        elsif user_input == '2'
            puts "Strand Flavors"
            puts "  "
            puts list_strands_info[save_input.at(0)].flavors
            puts "  "
            ss_flavor_options 

        elsif user_input == '3'
            puts "Strand Race"
            puts "  "
            puts list_strands_info[save_input.at(0)].race
            puts "  "
            ss_race_options
            
        elsif user_input == '0'
            puts "Thank You for stopping by!!!"
            goodbye

        else 
            puts "Not an option pick again please...."
            main_menu_options
        end
    end

    def ss_race_user_input
        user_input = gets.strip
        
        if user_input == '1'
            list_all_strands_name
            puts "Here are the strands by name..."
            main_menu_options

        elsif user_input == '2'
            puts "Strand Flavors"
            puts "  "
            puts list_strands_info[save_input.at(0)].flavors
            puts "  "
            ss_flavor_options 

        elsif user_input == '3'
            effects_options
            
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
