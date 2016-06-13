require './geodata.rb'

user = ARGV[0]
geodata = Geodata.new(user)
while (line = STDIN.gets) do
  data = line.strip.split(",")

  if (data[0] == user) then
    geodata.add_coordinates(data[1], data[2])
  end
end

exit if (geodata.get_coordinates().size == 0)

distance=ARGV[1]
geodata.make_grid(distance).each do |lat, lon|
  printf("%s,%s\n",lat,lon)
end


