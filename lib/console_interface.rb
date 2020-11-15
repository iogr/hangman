class ConsoleInterface
  FIGURES =
      Dir["#{__dir__}/../data/figures/*.txt"].sort
          .map { |file_name| File.read(file_name) }

  def initialize(game)
    @game = game
  end

  def errors_to_show
    @game.errors.join(', ')
  end

  def figure
    FIGURES[@game.errors_made]
  end

  def game_over?
    @game.won? || @game.lost?
  end

  def get_input
    print "Type next letter: "
    gets[0].upcase
  end

  def result
    if @game.won?
      "Congratulations, you won!".colorize(:blue).blink
    elsif @game.lost?
      "You loose, the word is #{@game.word}".colorize(:red).blink
    end
  end

  def print_out
    word = 'Word ' + word_to_show
    errors = 'Mistakes: (' + @game.errors_made.to_s + '): ' + errors_to_show.to_s
    puts <<~END
      #{word.colorize(:magenta)}
      #{figure.colorize(:yellow)}
      #{errors.colorize(:red)}
      You still have an attempt: #{@game.errors_allowed}
    END

    puts result if game_over?
  end

  def word_to_show
    result =
        @game.letters_to_quess.map do |letter|
          if letter.nil?
            '__'
          else
            letter
          end
        end
    result.join(' ')
  end
end
