require './geodata.rb'

users = Array.new
while (line = STDIN.gets) do
  data = line.split(",")

  users.push(data[0])
end

users.uniq.each do |user|
  puts(user)
end

