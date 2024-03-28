def parse_game_sets(sets)
  sets.map do |set|
    set.split(", ").map do |cube_data|
      cube_occurence, cube_color = cube_data.split(" ")
      {cube_color => cube_occurence.to_i}
    end
  end.flatten
end

def merge_hashes_with_max(hash_array)
  hash_array.reduce({}) do |memo, hash|
    memo.merge(hash) { |key, oldval, newval| [oldval, newval].max }
  end
end


res = 0

File.open("input.txt").each do |line|
  sets = line.split(": ")[1].chomp.split("; ")
  res += merge_hashes_with_max(parse_game_sets(sets)).values.reduce(:*)
end

p res
