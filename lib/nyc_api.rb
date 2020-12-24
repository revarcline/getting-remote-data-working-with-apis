require 'net/http'
require 'open-uri'
require 'json'

# where the magick happens
class GetPrograms
  URL = 'http://data.cityofnewyork.us/resource/uvks-tn5n.json'.freeze

  def get_programs
    uri = URI.parse(URL)
    response = Net::HTTP.get_response(uri)
    response.body
  end

  def program_school
    # use json library to parse api response into nicely formatted json
    programs.JSON.parse(get_programs)
    programs.collect { |program| program['agency'] }
  end
end

# programs = GetPrograms.new.get_programs
# puts programs

programs = GetPrograms.new
puts programs.program_school.uniq
