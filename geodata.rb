class Geodata
  def initialize(user)
    @user = user
    @coordinates = Array.new
  end

  def add_coordinates(lat, lon)
    @coordinates.push([lat, lon])
  end

  def get_coordinates()
    return (@coordinates)
  end

  def make_grid(distance=0)

    output = Array.new
    @coordinates.each do |lat, lon|
      unit_lat, unit_lon = calc_lat_distance(lat.to_f, lon.to_f, distance)
      grid_lat = (lat.to_f / unit_lat).to_i
      grid_lon = (lon.to_f / unit_lon).to_i

      output.push([grid_lat, grid_lon])
    end

    return (output)
  end

  def calc_lat_distance(lat, lon, dist) # dist in meter
    dist_POLE_RADIUS = 6356752.314 # North to South 6356km
    dist_EQUATOR_RADIUS = 6378137  # East to West 6378km
    lat_degree = ( 360 * 1000 ) / ( 2 * Math::PI * dist_POLE_RADIUS )
    lng_degree = ( 360 * 1000 ) / ( 2 * Math::PI * ( dist_EQUATOR_RADIUS * Math.cos(lat * Math::PI / 180.0) ) )

    return ([lat_degree * dist.to_f/1000, lng_degree* dist.to_f/1000]) # Returns degress for "dist" meters
  end

end
