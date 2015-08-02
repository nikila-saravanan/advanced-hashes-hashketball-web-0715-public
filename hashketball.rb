# Write your code here!
require 'pry'

def game_hash
  details = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {:player_name => "Alan Anderson",
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1},
        {:player_name => "Reggie Evans",
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7},
        {:player_name => "Brook Lopez",
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15},
        {:player_name => "Mason Plumlee",
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 12,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5},
        {:player_name => "Jason Terry",
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1}
      ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise","Purple"],
      :players => [
        {:player_name => "Jeff Adrien",
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2},
        {:player_name => "Bismak Biyombo",
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 7,
        :blocks => 15,
        :slam_dunks => 10},
        {:player_name => "DeSagna Diop",
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5},
        {:player_name => "Ben Gordon",
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0},
        {:player_name => "Brendan Haywood",
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 22,
        :blocks => 5,
        :slam_dunks => 12},
      ]
    }
  }
end

def num_points_scored(name)
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  score = 0
  #binding.pry
  home_players.each do |player_info|
    if player_info[:player_name] == name
      score = player_info[:points]
    else 
      away_players.each do |away_player_info|
        if away_player_info[:player_name] == name 
          score = away_player_info[:points]
        end
      end
    end
  end
  score
end

def shoe_size(name)
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  shoe_size = 0
  #binding.pry
  home_players.each do |player_info|
    if player_info[:player_name] == name
      shoe_size = player_info[:shoe]
    else 
      away_players.each do |away_player_info|
        if away_player_info[:player_name] == name 
          shoe_size = away_player_info[:shoe]
        end
      end
    end
  end
  shoe_size
end

def team_colors(team)
  colors = []
  if game_hash[:home][:team_name] == team
    colors = game_hash[:home][:colors]
  else
    colors = game_hash[:away][:colors]
  end
  colors
end

def team_names
  name1 = game_hash[:home][:team_name]
  name2 = game_hash[:away][:team_name]
  names = [name1,name2]
end

def player_numbers(team)
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  team_numbers = []
  if game_hash[:home][:team_name] == team 
    home_players.each do |player|
      team_numbers << player[:number]
    end
  else
    away_players.each do |player|
      team_numbers << player[:number]
    end
  end
  team_numbers
end

def player_stats(name)
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  stats = {}
  home_players.each do |player_info|
    if player_info[:player_name] == name
      #stats = player_info.delete(:player_name)
      stats = player_info.delete_if {|key,value| key == :player_name}
    else 
      away_players.each do |away_player_info|
        if away_player_info[:player_name] == name 
          stats = away_player_info.delete_if {|key,value| key == :player_name}
        end
      end
    end
  end
  stats
end

def big_shoe_rebounds
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  shoe_size = 0
  rebounds = 0
  home_players.each do |player|
    if shoe_size == 0 && rebounds == 0
      shoe_size = player[:shoe]
      rebounds = player[:rebounds]
    elsif player[:shoe] > shoe_size
      shoe_size = player[:shoe]
      rebounds = player[:rebounds]
    end
  end
  away_players.each do |player|
    if player[:shoe] > shoe_size
      shoe_size = player[:shoe]
      rebounds = player[:rebounds]
    end
  end
  rebounds 
end
