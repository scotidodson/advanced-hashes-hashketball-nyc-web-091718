require "pry"

def game_hash
  nested_game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1 
          },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
          },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
          },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
          },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1 
          }
        }
      },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
          },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
          },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
          },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
          },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
          }
        }
      }
    }
  nested_game_hash
end 

def num_points_scored(name)
  points_scored = 0
  game_hash.each do |home_or_away, values|
    values.each do |attribute, data|
      #data is Brooklyn Nets
      if attribute == :players
        data.each do |player, player_info|
          if player == name
            player_info.each do |info_type, answer|
              if info_type == :points && player == name
                points_scored = answer
              end
            end
          end
        end
      end
    end
  end
  points_scored
end


def shoe_size(name)
  shoe_size = 0
  game_hash.each do |home_or_away, values|
    values.each do |attribute, data|
      if attribute == :players
        data.each do |player, player_info|
          if player == name
            player_info.each do |info_type, answer|
              if info_type == :shoe && player == name
                shoe_size = answer
              end
            end
          end
        end
      end
    end
  end
  shoe_size
end

def team_colors(team_name)
  the_team_colors = ""
  game_hash.each do |key, value|
    value.each do |attribute, data|
      if game_hash[key][:team_name] == team_name
        the_team_colors = game_hash[key][:colors]
      end 
    end
  end
  the_team_colors
end 

def team_names
  team_names_answer = []
  team_names_answer << game_hash[:home][:team_name]
  team_names_answer << game_hash[:away][:team_name]
  team_names_answer
end

def player_numbers(team_name)
  numbers = []
  game_hash.each do |key, value|
    if game_hash[key][:team_name] == team_name 
      game_hash[key][:players].each do |player, options|
        numbers.push(options[:number])
      end
    end
  end
  numbers
end

def player_stats(player_name)
  game_hash.each do |key, value|
    game_hash[key][:players].each do |player, options|
      if player == player_name
        return options
      end
    end
  end 
end

def big_shoe_rebounds
  #find player with largest shoe size 
  all_sizes= []
  game_hash.each do |key, value|
    game_hash[key][:players].each do |player, options|
      all_sizes << shoe_size(player)
    end
  end
  all_sizes.sort!
  biggest_shoe = all_sizes[-1]

  #return rebounds of that player 
  
  game_hash.each do |key, value|
    game_hash[key][:players].each do |player, options|
      if options[:shoe] == biggest_shoe
        return options[:rebounds]
      end
    end
  end
end
