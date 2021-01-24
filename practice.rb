# counter = 0

# loop do
#   counter += 1
#   puts "iter #{counter} of loop"
#   if counter >= 10
#     break
#   end
# end

# def current_player(board)
#   turn_count(board) % 2 == 0 ? "X" : "O"
# end
 
# def turn_count(board)
#   board.count{|token| token == "X" || token == "O"}
# end
 
# def display_board(board)
#   puts " #{board[0]} | #{board[1]} | #{board[2]} "
#   puts "-----------"
#   puts " #{board[3]} | #{board[4]} | #{board[5]} "
#   puts "-----------"
#   puts " #{board[6]} | #{board[7]} | #{board[8]} "
# end

require 'net/http'
require 'open-uri'
require 'json'
 
class GetPrograms
 
  URL = "http://data.cityofnewyork.us/resource/uvks-tn5n.json"
 
  def get_programs
    uri = URI.parse(URL)
    response = Net::HTTP.get_response(uri)
    response.body
  end
  
  def program_school
    # we use the JSON library to parse the API response into nicely formatted JSON
    programs = JSON.parse(self.get_programs)
    programs.collect do |program|
      program["agency"]  
    end
  end

end
 
# programs = GetPrograms.new.get_programs
# puts programs

programs = GetPrograms.new
puts programs.program_school.uniq