#
# Usage:
#   cat revisits_logfile(MONGODB_JSON) | ruby convert_revisits.rb
#
# Output: CSV format
#   username, lat, lon
#

require 'json'

while (line = STDIN.gets) do
  data = JSON.parse(line)

  printf("%s,%s,%s\n", data["user_id"], data["latitude"], data["longitude"])
end

