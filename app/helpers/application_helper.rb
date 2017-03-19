module ApplicationHelper
  def google_map(place)
    "http://maps.googleapis.com/maps/api/staticmap?center=#{place.latitude},#{place.longitude}&markers=#{place.latitude},#{place.longitude}&zoom=7&size=640x400&key=AIzaSyDHpzc5r9heJlEUMWUh_N7GR2W3__e3m9o"
  end
end
