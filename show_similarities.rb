require './geodata.rb'

geodata = Hash.new
while (line = STDIN.gets) do
  data = line.split(",")

  if (geodata[data[0]] == nil) then
    geodata[data[0]] = Geodata.new(data[0])
  end
  geodata[data[0]].add_coordinates(data[1], data[2])
end

distance=ARGV[0]
users = geodata.keys
users.each do |u1|
  users.each do |u2|
    next if (u1 == u2)

    c1 = geodata[u1].make_grid(distance).uniq
    c2 = geodata[u2].make_grid(distance).uniq

    printf("%s,%s,%d,%d,%d,%d,%f\n",
      u1,
      u2,
      c1.size,
      c2.size,
      (c1&c2).size, (c1|c2).size,
      (c1&c2).size.to_f / (c1|c2).size.to_f)
  end
end


