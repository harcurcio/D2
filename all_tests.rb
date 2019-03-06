#Harlie Curcio
require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require_relative 'main'
class All_Tests < Minitest::Test 
    
    #setting the wrong boundary int
    #edge!
    def test_raises_incorrect_prospectors_input
        assert_raises "Should raise error when prospectors input is less than or equal to 0!\n\n" do
            ruby_rush=RubyRush.new(1, 2, 3)
            ruby_rush.prospectors_check(0)
        end
        
        assert_raises "Should raise error when prospectors input is not an integer!\n\n" do
            ruby_rush=RubyRush.new(1, 2, 3)
            rb_rush.prospectors_check(1.1)
        end
         
        assert_raises "Should raise error when prospectors input is not an integer and is less than or equal to 0!\n\n" do
            ruby_rush=RubyRush.new(1, 2, 3)
            ruby_rush.prospectors_check(-1.1)
        end
        
        assert_raises "Should raise error when prospectors input is not a number!\n\n" do
            ruby_rush=RubyRush.new(1, 2, 3)
            ruby_rush.prospectors_check("")
        end
        
    end
    
    #unit testing giving an incorrect input for the seed, looking for int
    #edge case
    def test_raises_incorrect_seed_input
         
        assert_raises "Raise error when seed input is not an int\n\n" do
            ruby_rush=RubyRush.new(1, 2, 3)
            ruby_rush.seed_check(1.1)
        end
        
         assert_raises "Raise error when seed input is not a number\n\n" do
            ruby_rush=RubyRush.new(1, 2, 3)
            ruby_rush.seed_check("")
        end
    end
    
    #setting an incorrect val for turns
    #edge!
    def test_raises_incorrect_turns_input
        assert_raises "Should raise error when turns input is less than or equal to 0!\n\n" do
            ruby_rush=RubyRush.new(1, 2, 3)
            ruby_rush.turns_check(0)
        end
        
        assert_raises "Should raise error when turns input is not an integer!\n\n" do
            ruby_rush=RubyRush.new(1, 2, 3)
            ruby_rush.turns_check(1.1)
        end
        
        assert_raises "Should raise error when turns input is not an integer and is less than or equal to 0!\n\n" do
            ruby_rush=RubyRush.new(1, 2, 3)
            ruby_rush.turns_check(-1.1)
        end
        
         assert_raises "Should raise error when turns input is not a number!\n\n" do
            ruby_rush=RubyRush.new(1, 2, 3)
            ruby_rush.turns_check("")
        end
    end  
    
    #unit testing incorrect number for input
    def test_raises_incorrect_number_input
        assert_raises "Should raise error when input number is incorrect!\n\n" do
            ruby_rush=RubyRush.new(1, 2)
            
        end
    end

    #check the instance vars for curr ruby and curr fake ruby!
    def test_check_plural
        ruby_rush=RubyRush.new(1, 2, 3)
        ruby_rush.cur_real_rb=0
        ruby_rush.cur_fake_rb=1
        assert_equal "rubies,ruby", ruby_rush.check_plural
        ruby_rush.real_sp='ruby'
        ruby_rush.fake_sp='ruby'
        ruby_rush.cur_real_rb=1
        ruby_rush.cur_fake_rb=0
        assert_equal "ruby,rubies", ruby_rush.check_plural
        ruby_rush.real_sp='ruby'
        ruby_rush.fake_sp='ruby'
        ruby_rush.cur_real_rb=2
        ruby_rush.cur_fake_rb=2
        assert_equal "rubies,rubies", ruby_rush.check_plural
        ruby_rush.real_sp='ruby'
        ruby_rush.fake_sp='ruby'
        
    end
    
    #check for total real and fake rubies!
    def test_check_plural_total
        ruby_rush=RubyRush.new(1, 2, 3)
        ruby_rush.real_rb=0
        ruby_rush.fake_rb=1
        assert_equal "rubies,ruby", ruby_rush.check_plural_total
        ruby_rush.total_real_sp='ruby'
        ruby_rush.total_fake_sp='ruby'
        ruby_rush.real_rb=1
        ruby_rush.fake_rb=0
        assert_equal "ruby,rubies", ruby_rush.check_plural_total
        ruby_rush.total_real_sp='ruby'
        ruby_rush.total_fake_sp='ruby'
        ruby_rush.real_rb=2
        ruby_rush.fake_rb=2
        assert_equal "rubies,rubies", ruby_rush.check_plural_total
        ruby_rush.real_sp='ruby'
        ruby_rush.fake_sp='ruby'
    end
    
    
    #checks the var for days
    def test_check_days
        ruby_rush=RubyRush.new(1, 2, 3)
        ruby_rush.days=1
        assert_equal "day", ruby_rush.check_days
        ruby_rush.dayys="day"
        ruby_rush.days=2
        assert_equal "days", ruby_rush.check_days
        ruby_rush.dayys="day"
    end
    
    #checking the mood of the prospector
    def test_print_out_mood
        ruby_rush=RubyRush.new(1, 2, 3)
        ruby_rush.real_rb=10
        assert_output("Going home victorious!\n") {ruby_rush.print_out_mood}
        ruby_rush.real_rb=9
        assert_output("Going home sad.\n") {ruby_rush.print_out_mood}
        ruby_rush.real_rb=0
        assert_output("Going home empty-handed.\n") {ruby_rush.print_out_mood}
    end

    #test the var of gains
    def test_print_out_gains
        ruby_rush=RubyRush.new(1, 2, 3)
        ruby_rush.days=10
        ruby_rush.real_rb=10
        ruby_rush.fake_rb=10
        ruby_rush.prospector=1
        assert_output("After 10 days, Rubyist 1 found:\n\t10 rubies.\n\t10 fake rubies.\n") {ruby_rush.print_out_gains}
    end
    
    #check for a valid next move! - from canyon to next
    def test_move_turns_enumerable_canyon_to_duck_type_beach
        ruby_rush=RubyRush.new(1, 2, 3)
        ruby_rush.turn=10
        ruby_rush.random(ruby_rush.seed)
        ruby_rush.move_turns_enumerable_canyon
        assert_includes ['Duck Type Beach', 'Monkey Patch City'], ruby_rush.city
        
     end
    
    
    #also checks for a valid next move - from duck to next
    def test_move_turns_duck_type_beach
        ruby_rush=RubyRush.new(1, 2, 3)
        ruby_rush.turn=10
        ruby_rush.random(ruby_rush.seed)
        ruby_rush.move_turns_duck_type_beach
        assert_includes ['Enumerable Canyon', 'Matzburg'], ruby_rush.city
    end
   
    
    #valid next move - from palisades to next
     def test_move_turns_dynamic_palisades
        ruby_rush=RubyRush.new(1, 2, 3)
        ruby_rush.turn=10
        ruby_rush.random(ruby_rush.seed)
        ruby_rush.move_turns_dynamic_palisades
        assert_includes ['Matzburg', 'Hash Crossing'], ruby_rush.city
    end
    
    
    #next move for matzburgh
    def test_move_turns_matzburgh
        ruby_rush=RubyRush.new(1, 2, 3)
        ruby_rush.turn=10
        ruby_rush.random(ruby_rush.seed)
        ruby_rush.move_turns_matzburgh
        assert_includes ['Monkey Patch City', 'Duck Type Beach', 'Hash Crossing', 'Dynamic Palisades'], ruby_rush.city
    end
    
    
    #next move for hash crossing
    def test_move_turns_hash_crossing
        ruby_rush=RubyRush.new(1, 2, 3)
        ruby_rush.turn=10
        ruby_rush.random(ruby_rush.seed)
        ruby_rush.move_turns_hash_crossing
        assert_includes ['Matzburg', 'Nil Town', 'Dynamic Palisades'], ruby_rush.city
    end
    
    
    #next move for mokey patch
     def test_move_turns_monkey_patch_city
        ruby_rush=RubyRush.new(1, 2, 3)
        ruby_rush.turn=10
        ruby_rush.random(ruby_rush.seed)
        ruby_rush.move_turns_monkey_patch_city
        assert_includes ['Nil Town', 'Enumerable Canyon', 'Matzburg'], ruby_rush.city
    end
    
    
    #next move for nil
    def test_move_turns_nil_town
        ruby_rush=RubyRush.new(1, 2, 3)
        ruby_rush.turn=10
        ruby_rush.random(ruby_rush.seed)
        ruby_rush.move_turns_nil_town
        assert_includes ['Monkey Patch City', 'Hash Crossing'], ruby_rush.city
    end
    
    
   
    #seeing if canyon found something works
    #stub method
    def test_enumerable_canyon_search_found_something
        ruby_rush=RubyRush.new(1, 2, 3)
        doubled_prng = Minitest::Mock.new('doubled prng')
        def doubled_prng.rand(seed); 1; end
        ruby_rush.prng=doubled_prng
        ruby_rush.cur_real_rb=1
        ruby_rush.cur_fake_rb=1
        assert_output("\tFound #{ruby_rush.cur_real_rb} #{ruby_rush.real_sp} and #{ruby_rush.cur_fake_rb} fake #{ruby_rush.fake_sp} in #{ruby_rush.city}.\n" ) {ruby_rush. enumerable_canyon_search}
    end
    
    
    #duck beach found something
    #stub method
    def test_duck_type_beach_search_found_something
        ruby_rush=RubyRush.new(1, 2, 3)
        doubled_prng = Minitest::Mock.new('doubled prng')
        def doubled_prng.rand(seed); 2; end
        ruby_rush.prng=doubled_prng
        ruby_rush.cur_real_rb=2
        ruby_rush.cur_fake_rb=2
        ruby_rush.real_sp='rubies'
        ruby_rush.fake_sp='rubies'
        assert_output("\tFound #{ruby_rush.cur_real_rb} #{ruby_rush.real_sp} and #{ruby_rush.cur_fake_rb} fake #{ruby_rush.fake_sp} in #{ruby_rush.city}.\n" ) {ruby_rush. duck_type_beach_search}
    end
    
    
    #palisades found something
    #stub method
    def test_dynamic_palisades_search_found_something
        ruby_rush=RubyRush.new(1, 2, 3)
        doubled_prng = Minitest::Mock.new('doubled prng')
        def doubled_prng.rand(seed); 2; end
        ruby_rush.prng=doubled_prng
        ruby_rush.cur_real_rb=2
        ruby_rush.cur_fake_rb=2
        ruby_rush.real_sp='rubies'
        ruby_rush.fake_sp='rubies'
        assert_output("\tFound #{ruby_rush.cur_real_rb} #{ruby_rush.real_sp} and #{ruby_rush.cur_fake_rb} fake #{ruby_rush.fake_sp} in #{ruby_rush.city}.\n" ) {ruby_rush. dynamic_palisades_search}
    end
    
    
    #matzburgh found something
    #stub method
    def test_matzburgh_search_found_something
        ruby_rush=RubyRush.new(1, 2, 3)
        doubled_prng = Minitest::Mock.new('doubled prng')
        def doubled_prng.rand(seed); 3; end
        ruby_rush.prng=doubled_prng
        ruby_rush.cur_real_rb=3
        ruby_rush.real_sp='rubies'
        assert_output("\tFound #{ruby_rush.cur_real_rb} #{ruby_rush.real_sp} in #{ruby_rush.city}.\n" ) {ruby_rush.matzburgh_search}
    end
    
    
    #hash crossing found something
    #stub method
    def test_hash_crossing_search_found_something
        ruby_rush=RubyRush.new(1, 2, 3)
        doubled_prng = Minitest::Mock.new('doubled prng')
        def doubled_prng.rand(seed); 2; end
        ruby_rush.prng=doubled_prng
        ruby_rush.cur_real_rb=2
        ruby_rush.cur_fake_rb=2
        ruby_rush.real_sp='rubies'
        ruby_rush.fake_sp='rubies'
         assert_output("\tFound #{ruby_rush.cur_real_rb} #{ruby_rush.real_sp} and #{ruby_rush.cur_fake_rb} fake #{ruby_rush.fake_sp} in #{ruby_rush.city}.\n" ) {ruby_rush.hash_crossing_search}
    end
    
    
    #monkey patch found something
    #stub method
    def test_monkey_patch_city_search_found_something
        ruby_rush=RubyRush.new(1, 2, 3)
        doubled_prng = Minitest::Mock.new('doubled prng')
        def doubled_prng.rand(seed); 1; end
        ruby_rush.prng=doubled_prng
        ruby_rush.cur_real_rb=1
        ruby_rush.cur_fake_rb=1
        ruby_rush.real_sp='ruby'
        ruby_rush.fake_sp='ruby'
         assert_output("\tFound #{ruby_rush.cur_real_rb} #{ruby_rush.real_sp} and #{ruby_rush.cur_fake_rb} fake #{ruby_rush.fake_sp} in #{ruby_rush.city}.\n" ) {ruby_rush.monkey_patch_city_search}
    end
    
    
    #nil town found something
    #stub method
    def test_nil_town_search_found_something
        ruby_rush=RubyRush.new(1, 2, 3)
        doubled_prng = Minitest::Mock.new('doubled prng')
        def doubled_prng.rand(seed); 3; end
        ruby_rush.prng=doubled_prng
        ruby_rush.cur_fake_rb=3
        ruby_rush.fake_sp='rubies'
         assert_output("\tFound #{ruby_rush.cur_fake_rb} fake #{ruby_rush.fake_sp} in #{ruby_rush.city}.\n" ) {ruby_rush.nil_town_search}
    end

      #does found nothing work
    def test_print_out_found_nothing
        ruby_rush=RubyRush.new(1, 2, 3)
        ruby_rush.real_sp='rubies'
        ruby_rush.fake_sp='rubies'
        assert_output ("\tFound no #{ruby_rush.real_sp} or fake #{ruby_rush.fake_sp} in #{ruby_rush.city}.\n") {ruby_rush.print_out_found_nothing}
    end
    
end