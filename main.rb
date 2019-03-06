# Program for ruby digging
class RubyRush
  attr_accessor :seed, :prospectors, :turns, :days, :real_rb
  attr_accessor :fake_rb, :city, :turn, :prospector, :cur_real_rb
  attr_accessor :cur_fake_rb, :real_sp, :fake_sp, :move, :total_real_sp
  attr_accessor :total_fake_sp, :dayys, :last_city, :prng

  def initialize(seed, prospectors, turns)
    seed_check(seed)
    prospectors_check(prospectors)
    turns_check(turns)
    # @seed = seed
    # @prospectors = prospectors
    # @turns = turns
    # Check whether the number of input is correct.
    # input_num_check(@seed, @prospectors, @turns)
    # Check valid seed or not.
    # seed_check @seed
    # Check valid prospectors or not.
    # prospectors_check @prospectors
    # Check valid turns or not.
    # turns_check @turns
    # Call generate random method.
    # random(@seed)
    # srand(@seed)
    @days = 0
    @real_rb = 0
    @fake_rb = 0
    @city = 'Enumerable Canyon'
    @turn = 1
    @prospector = 1
    @cur_real_rb = 0
    @cur_fake_rb = 0
    @real_sp = 'ruby'
    @fake_sp = 'ruby'
    @move = 0
    @total_real_sp = 'ruby'
    @total_fake_sp = 'ruby'
    @dayys = 'day'
    @last_city = 'Enumerable Canyon'
  end

  def seed_check(seed)
    begin
      seed = Float(seed)
    rescue ArgumentError, TypeError
      seed = -1.1
    end
    raise "*seed* should be an integer!\n" unless Integer(seed) == Float(seed)

    @seed = Integer(seed)
  end

  def prospectors_check(prospectors)
    begin
      prospectors = Float(prospectors)
    rescue ArgumentError, TypeError
      prospectors = -1.1
    end
    raise "*prospectors* should be a non-negative integer!\n" unless Integer(prospectors) == Float(prospectors) && Integer(prospectors) > 0

    @prospectors = Integer(prospectors)
  end

  def turns_check(turns)
    begin
      turns = Float(turns)
    rescue ArgumentError, TypeError
      turns = -1.1
    end
    raise "*turns* should be a non-negative integer!\n" unless Integer(turns) == Float(turns) && Integer(turns) > 0

    @turns = Integer(turns)
  end

  def random(seed)
    @prng = Random.new(seed)
  end

  def ruby_digging
    @cur_real_rb = 0
    @cur_fake_rb = 0
    @move = 0
    @real_sp = 'ruby'
    @fake_sp = 'ruby'
    case @city
    when 'Enumerable Canyon'
      enumerable_canyon_search
    when 'Duck Type Beach'
      duck_type_beach_search
    when 'Dynamic Palisades'
      dynamic_palisades_search
    when 'Matzburg'
      matzburgh_search
    when 'Hash Crossing'
      hash_crossing_search
    when 'Monkey Patch City'
      monkey_patch_city_search
    when 'Nil Town'
      nil_town_search
    end
  end

  def input_num_check(seed, prospectors, turns)
    raise "There should have exactly three inputs!\n" unless !seed.nil? && !prospectors.nil? && !turns.nil?
  end

   def print_change_turn
    puts "Heading from #{@last_city} to #{@city}."
  end

  def enumerable_canyon_search
    @days += 1
    @cur_real_rb = @prng.rand(0..1)
    @cur_fake_rb = @prng.rand(0..1)
    @real_rb += @cur_real_rb
    @fake_rb += @cur_fake_rb
    # Check plural or not.
    check_plural
    # print out found when found anything.
    print_out_found if @cur_real_rb != 0 || @cur_fake_rb != 0
    # ruby_digging if @cur_real_rb != 0 || @cur_fake_rb != 0
    print_out_found_nothing if @cur_real_rb.zero? && @cur_fake_rb.zero?
    move_turns_enumerable_canyon if @cur_real_rb.zero? && @cur_fake_rb.zero?
  end

  def duck_type_beach_search
    @days += 1
    @cur_real_rb = @prng.rand(0..2)
    @cur_fake_rb = @prng.rand(0..2)
    @real_rb += @cur_real_rb
    @fake_rb += @cur_fake_rb
    # Check plural or not.
    check_plural
    # print out found when found anything.
    print_out_found if @cur_real_rb != 0 || @cur_fake_rb != 0
    # ruby_digging if @cur_real_rb != 0 || @cur_fake_rb != 0
    print_out_found_nothing if @cur_real_rb.zero? && @cur_fake_rb.zero?
    move_turns_duck_type_beach if @cur_real_rb.zero? && @cur_fake_rb.zero?
  end

  def dynamic_palisades_search
    @days += 1
    @cur_real_rb = @prng.rand(0..2)
    @cur_fake_rb = @prng.rand(0..2)
    @real_rb += @cur_real_rb
    @fake_rb += @cur_fake_rb
    # Check plural or not.
    check_plural
    # print out found when found anything.
    print_out_found if @cur_real_rb != 0 || @cur_fake_rb != 0
    # ruby_digging if @cur_real_rb != 0 || @cur_fake_rb != 0
    print_out_found_nothing if @cur_real_rb.zero? && @cur_fake_rb.zero?
    move_turns_dynamic_palisades if @cur_real_rb.zero? && @cur_fake_rb.zero?
  end

  def matzburgh_search
    @days += 1
    @cur_real_rb = @prng.rand(0..3)
    @cur_fake_rb = 0
    @real_rb += @cur_real_rb
    @fake_rb += @cur_fake_rb
    # Check plural or not.
    check_plural
    # print out found when found anything.
    print_out_found if @cur_real_rb != 0 || @cur_fake_rb != 0
    # ruby_digging if @cur_real_rb != 0 || @cur_fake_rb != 0
    print_out_found_nothing if @cur_real_rb.zero? && @cur_fake_rb.zero?
    move_turns_matzburgh if @cur_real_rb.zero? && @cur_fake_rb.zero?
  end

  def hash_crossing_search
    @days += 1
    @cur_real_rb = @prng.rand(0..2)
    @cur_fake_rb = @prng.rand(0..2)
    @real_rb += @cur_real_rb
    @fake_rb += @cur_fake_rb
    # Check plural or not.
    check_plural
    # print out found when found anything.
    print_out_found if @cur_real_rb != 0 || @cur_fake_rb != 0
    # ruby_digging if @cur_real_rb != 0 || @cur_fake_rb != 0
    print_out_found_nothing if @cur_real_rb.zero? && @cur_fake_rb.zero?
    move_turns_hash_crossing if @cur_real_rb.zero? && @cur_fake_rb.zero?
  end

  def monkey_patch_city_search
    @days += 1
    @cur_real_rb = @prng.rand(0..1)
    @cur_fake_rb = @prng.rand(0..1)
    @real_rb += @cur_real_rb
    @fake_rb += @cur_fake_rb
    # Check plural or not.
    check_plural
    # print out found when found anything.
    print_out_found if @cur_real_rb != 0 || @cur_fake_rb != 0
    # ruby_digging if @cur_real_rb != 0 || @cur_fake_rb != 0
    print_out_found_nothing if @cur_real_rb.zero? && @cur_fake_rb.zero?
    move_turns_monkey_patch_city if @cur_real_rb.zero? && @cur_fake_rb.zero?
  end

  def nil_town_search
    @days += 1
    @cur_real_rb = 0
    @cur_fake_rb = @prng.rand(0..3)
    @real_rb += @cur_real_rb
    @fake_rb += @cur_fake_rb
    # Check plural or not.
    check_plural
    # print out found when found anything.
    print_out_found if @cur_real_rb != 0 || @cur_fake_rb != 0
    # ruby_digging if @cur_real_rb != 0 || @cur_fake_rb != 0
    print_out_found_nothing if @cur_real_rb.zero? && @cur_fake_rb.zero?
    move_turns_nil_town if @cur_real_rb.zero? && @cur_fake_rb.zero?
  end

  def check_plural
    @real_sp = 'rubies' if @cur_real_rb > 1 || @cur_real_rb.zero?
    @fake_sp = 'rubies' if @cur_fake_rb > 1 || @cur_fake_rb.zero?
    "#{real_sp},#{fake_sp}"
  end

  def check_days
    @dayys = 'days' if @days > 1 || @days.zero?
    @dayys.to_s
  end


  def print_out_found
    puts "\tFound #{@cur_real_rb} #{@real_sp} in #{@city}." if @cur_real_rb != 0 && @cur_fake_rb.zero?
    puts "\tFound #{@cur_fake_rb} fake #{@fake_sp} in #{@city}." if @cur_real_rb.zero? && @cur_fake_rb != 0
    print_out_found_long if @cur_real_rb != 0 && @cur_fake_rb != 0
  end

   def check_plural_total
    @total_real_sp = 'rubies' if @real_rb > 1 || @real_rb.zero?
    @total_fake_sp = 'rubies' if @fake_rb > 1 || @fake_rb.zero?
    "#{total_real_sp},#{total_fake_sp}"
  end

  def print_out_found_long
    puts "\tFound #{@cur_real_rb} #{@real_sp} and #{@cur_fake_rb} fake #{@fake_sp} in #{@city}."
  end

  def print_out_found_nothing
    puts "\tFound no #{@real_sp} or fake #{@fake_sp} in #{@city}."
  end

  def move_turns_enumerable_canyon
    @turn += 1
    # @days += 1 if @turn > @turns
    # break if @turn > @turns
    @last_city = @city
    @move = @prng.rand(1..2)
    if @move == 1 then @city = 'Duck Type Beach'
    elsif @move == 2 then @city = 'Monkey Patch City'
    end
    print_change_turn if @turn <= @turns
    # puts "Heading from Enumerable Canyon to #{@city}."
  end

  def move_turns_duck_type_beach
    @turn += 1
    # @days += 1 if @turn > @turns
    # break if @turn > @turns
    @last_city = @city
    @move = @prng.rand(1..2)
    if @move == 1 then @city = 'Enumerable Canyon'
    elsif @move == 2 then @city = 'Matzburg'
    end
    print_change_turn if @turn <= @turns
    # puts "Heading from Duck Type Beach to #{@city}."
  end

  def move_turns_dynamic_palisades
    @turn += 1
    # @days += 1 if @turn > @turns
    # break if @turn > @turns
    @last_city = @city
    @move = @prng.rand(1..2)
    if @move == 1 then @city = 'Matzburg'
    elsif @move == 2 then @city = 'Hash Crossing'
    end
    print_change_turn if @turn <= @turns
    # puts "Heading from Dynamic Palisades to #{@city}."
  end

  def move_turns_matzburgh
    @turn += 1
    # @days += 1 if @turn > @turns
    # break if @turn > @turns
    @last_city = @city
    @move = @prng.rand(1..4)
    if @move == 1 then @city = 'Monkey Patch City'
    elsif @move == 2 then @city = 'Duck Type Beach'
    elsif @move == 3 then @city = 'Hash Crossing'
    elsif @move == 4 then @city = 'Dynamic Palisades'
    end
    print_change_turn if @turn <= @turns
    # puts "Heading from Matzburg to #{@city}."
  end

  def move_turns_hash_crossing
    @turn += 1
    # @days += 1 if @turn > @turns
    # break if @turn > @turns
    @last_city = @city
    @move = @prng.rand(1..3)
    if @move == 1 then @city = 'Matzburg'
    elsif @move == 2 then @city = 'Nil Town'
    elsif @move == 3 then @city = 'Dynamic Palisades'
    end
    print_change_turn if @turn <= @turns
    # puts "Heading from Hash Crossing to #{@city}."
  end

  def move_turns_monkey_patch_city
    @turn += 1
    # @days += 1 if @turn > @turns
    # break if @turn > @turns
    @last_city = @city
    @move = @prng.rand(1..3)
    if @move == 1 then @city = 'Nil Town'
    elsif @move == 2 then @city = 'Enumerable Canyon'
    elsif @move == 3 then @city = 'Matzburg'
    end
    print_change_turn if @turn <= @turns
    # puts "Heading from Monkey Patch City to #{@city}."
  end

  def move_turns_nil_town
    @turn += 1
    # @days += 1 if @turn > @turns
    # break if @turn > @turns
    @last_city = @city
    @move = @prng.rand(1..2)
    if @move == 1 then @city = 'Monkey Patch City'
    elsif @move == 2 then @city = 'Hash Crossing'
    end
    print_change_turn if @turn <= @turns
    # puts "Heading from Nil Town to #{@city}."
  end

  def print_out_mood
    if real_rb >= 10 then puts 'Going home victorious!'
    elsif real_rb <= 9 && real_rb > 0 then puts 'Going home sad.'
    elsif real_rb.zero? then puts 'Going home empty-handed.'
    end
  end

   def print_out_gains
    @total_real_sp = 'ruby'
    @total_fake_sp = 'ruby'
    @dayys = 'day'
    # Check the plural of final gain for prospectors.
    check_plural_total
    # Check the plural of total days.
    check_days
    puts "After #{@days} #{@dayys}, Rubyist #{@prospector} found:"
    puts "\t#{@real_rb} #{@total_real_sp}."
    puts "\t#{@fake_rb} fake #{@total_fake_sp}."
  end
end