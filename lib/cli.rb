# require_relative "./api.rb"
require_relative "./environment.rb"

class CLI 

    # attr_reader :strands_info, :strand_name
    
    @@input = []

    def initialize
        start
    end
    
    def start
        puts "Welcome to The Cannabis Api"
        puts "Grabbing your list of Strands"
        puts "Please hold..."
        list_all_strands_name
        main_menu_options
    end
    
    def list_all_strands_name
        STRAND.all.each.with_index(1) do |name, i|
            puts "#{i}. #{name[0]}"
        end
    end
    
    def strand_name_call
          strand_name = []
        STRAND.all.each do |name| 
            strand_name << name[0].chop
        # binding.pry
        end
        strand_name
    end

    def list_strands_info
        strands_info_hash = STRAND.all.to_h
        info_array = []
        strands_info_hash.each_value do |info|
            info_array << info
        end
        info_array.flatten
    end
    
    def main_menu_options
        puts "Enter the number for the Strand you want..."
        puts "Type '0' to exit"
        main_menu_input
    end
    
    def main_menu_input
        user_input = gets.strip
        save_input << user_input.to_i
        if user_input.to_i.between?(1, STRAND.all.length)
            puts " "
            puts strand_name_call[user_input.to_i-1]
            puts " "
            s_name_sub_menu_options
            
            
        elsif user_input == '0'
            puts "Thank You for stopping by!!!"
            goodbye
            
        else 
            puts "Not an option pick again please...."
            main_menu_options
        end
    end
    
    def save_input 
        @@input
    end
    
    def s_name_sub_menu_options
        puts "Enter '1' for flavors of this Strand..."
        puts "Enter '2' for effects of this Strand..."
        puts "Enter '3' for the race of this Strand..."
        puts "Enter '4' to list name of Strands..."
        puts "Enter '0' to exit..."
        s_name_sub_user_input
    end
    
    def s_name_sub_user_input
        user_input = gets.strip
        
        if user_input == '1'
            puts "Here are the flavors for this Strand..."
            puts list_strands_info[save_input.at(0)]["flavors"]
            binding.pry              
            ss_flavor_options 
            
        elsif user_input == '2'
            puts "Here are the effects of this Strand..."
            puts list_strands_info[save_input.at(0)]["effects"].flatten
                ss_effects_options

            elsif user_input == '3'
                puts "This is the race of this Strand..."
                puts list_strands_info[save_input.at(0)]["race"]
                ss_race_options

            elsif user_input == '4'
                list_all_strands_name
                main_menu_input

            elsif user_input == '0'
                goodbye

            else
                puts "Not an option pick again please...."
                s_name_sub_menu_options
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
            puts "Here are the effects of this Strand..."
            puts list_strands_info[save_input.at(0)]["effects"].flatten
            ss_effects_options

        elsif user_input == '3'
            puts "This is the race of this Strand..."
            puts list_strands_info[save_input.at(0)]["race"]
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
            puts "Here are the flavors for this Strand..."
            puts list_strands_info[save_input.at(0)]["flavors"]
            ss_flavor_options 

        elsif user_input == '3'
            puts "Here are the effects of this Strand..."
                puts list_strands_info[save_input.at(0)]["effects"]
                ss_effects_options
            
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
            puts "Here are the flavors for this Strand..."
            puts list_strands_info[save_input.at(0)]["flavors"]
            ss_flavor_options 

        elsif user_input == '3'
            puts "This is the race of this Strand..."
            puts list_strands_info[save_input.at(0)]["race"]
            ss_race_options
            
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
# Here are the effects of this Strand...
# {"positive"=>["Relaxed", "Hungry", "Happy", "Sleepy"]
#     , "negative"=>["Dizzy"], "medical"=>["Depression", 
#         "Insomnia", "Pain", "Stress", "Lack of Appetite"]}