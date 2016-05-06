require 'pry' 

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash.each do |season, holidays|
    holidays.each do |day, supply|
      if season == :summer
        return supply[1]
      end
    end
  end
    
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above 
  # add the second argument, which is a supply, to BOTH the 
  # Christmas AND the New Year's arrays
  holiday_hash.each do |season, holidays|
    holidays.each do |day, supplies|
      if season == :winter
        supplies << supply
      end
    end
  end
  
end
 

def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash.each do |season, holidays|
    holidays.each do |day, supplies|
      if day == :memorial_day
        supplies << supply
      end
    end
  end
  
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash.each do |seasons, holidays|
    holidays.each do |day, supplies|
      if seasons == season
        #binding.pry
        holiday_hash[season] = {holiday_name => supply_array}
      end
    end
  end
  
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  winter_supplies = Array.new
  holiday_hash.each do |season, holidays|
    holidays.each do |day, supplies|
      if season == :winter
        i = 0
        while i < supplies.length
          winter_supplies << supplies[i]
          i+=1
        end
      end
    end
  end
  winter_supplies
  
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season, holidays|
    puts "#{season.capitalize}" + ":"
    holidays.each do |day, supplies|
      day_string = day.to_s
      day_array = day_string.split("_")
      i=0
      while i < day_array.length
        day_array[i].capitalize!
        i+=1
      end
      day = day_array.join(" ")
      puts "  #{day}" + ": " + "#{supplies.join(", ")}"
    end
  end
  
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  bbq_holidays_array = Array.new
  holiday_hash.each do |season, holidays|
    holidays.each do |day, supplies|      
      i = 0
      while i < supplies.length
        if supplies[i] == "BBQ"
          bbq_holidays_array << holidays.keys
        end 
        i+=1
      end
    end
  end
  bbq_holidays_array.flatten
end