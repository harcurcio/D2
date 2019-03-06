require_relative 'main'
raise "Please input three integers!\n" unless ARGV.count == 3

seed = ARGV[0]
prospectors = ARGV[1]
turns = ARGV[2]
rs = RubyRush.new(seed, prospectors, turns)
rs.random(Integer(seed))
while rs.prospector <= rs.prospectors
  rs.days = 0
  rs.real_rb = 0
  rs.fake_rb = 0
  rs.city = 'Enumerable Canyon'
  rs.turn = 1
  puts "Rubyist #{rs.prospector} starting in Enumerable Canyon."
  rs.ruby_digging while rs.turn <= rs.turns
  rs.print_out_gains
  rs.print_out_mood
  rs.prospector += 1
end