MAX_COLOR_RULES = { 
  red_max: 12,
  green_max: 13,
  blue_max: 14
}

def parse_game_sets(sets)
  sets.map do |set|
    set.split(", ").map do |cube_data|
      cube_occurence, cube_color = cube_data.split(" ")
      [cube_color, cube_occurence.to_i]
    end.to_h
  end
end

def game_is_possible?(game_sets, rules)
  parse_game_sets(game_sets).all? do |game_set|
    game_set["red"].to_i <= rules[:red_max] &&
    game_set["green"].to_i <= rules[:green_max] &&
    game_set["blue"].to_i <= rules[:blue_max]
  end
end

res = 0

File.open("input.txt").each do |line|
  line = line.split(":").map(&:chomp)

  game_id = line[0].scan(/\d+/).first.to_i
  game_sets = line[1].split(";")

  res += game_id if game_is_possible?(game_sets, MAX_COLOR_RULES)
end

p res

