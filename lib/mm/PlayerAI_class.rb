# based on Donald Knuth's Five-guess algorithm (http://en.wikipedia.org/wiki/Mastermind_(board_game)#Algorithms)
class PlayerAI < Player
	attr_writer :last_rating

	def initialize
		ai_options = ["William", "Harry", "Duke of Wellington", "Obama", "Society of Jesus", 
			    "Mormons", "Banking System", "Boris Johnson", "SHUE", "Berl"]
		super(ai_options.sample)
	end

	# Randomly choose a code for the human player to guess
	def make_code
		code = []
		print "Press Enter to generate #{ name }'s secret code..."; gets
		Settings::BOARD_WIDTH.times {	code << rand(6) + 1 }
		puts "Secret code generated...Begin guessing, human"
		code
	end

	def make_guess
		print "Press Enter to generate #{ name }'s next guess..."; gets
		return handle_first_guess if @first_guess
		update_possible_codes
		@last_guess = @possible_codes.sample
	end

	# Setup the AI to begin guessing
	def setup
		@first_guess = true
		generate_possible_codes
	end

	def human?
		false
	end

	def ai?
		true
	end

	private

	# Select only the codes that could have produced the rating feedback
	# received for the AI's last guess
	def update_possible_codes
		@possible_codes.select! do |code|
			Settings.rate_guess(code, @last_guess) == @last_rating
		end
	end

	# Select a random code for the first guess
	def handle_first_guess
		@first_guess = false
		@last_guess = @possible_codes.sample
	end

	# Generate all possible codes
	def generate_possible_codes
		@possible_codes = []
		(1..6).each do |color1|
			(1..6).each do |color2|
				(1..6).each do |color3|
					(1..6).each do |color4|
						@possible_codes << [color1, color2, color3, color4]
					end
				end
			end			
		end
	end

end