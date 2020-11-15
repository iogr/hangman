class Game
  TOTAL_ERRORS_ALLOWED = 7

  def initialize(word)
    @letters = word.chars
    @letters_normalized = normalized_letters
    @user_guesses = []
  end

  def errors
    @user_guesses - @letters_normalized
  end

  def errors_allowed
    TOTAL_ERRORS_ALLOWED - errors_made
  end

  def errors_made
    errors.size
  end

  def letters_to_quess
    @letters_normalized.map.with_index do |letter, index|
      if @user_guesses.include?(letter)
        @letters[index]
      else
        nil
      end
    end
  end

  def lost?
    errors_allowed == 0
  end

  def normalize_letter(letter)
    case letter
    when 'Й'
      'И'
    when 'Ё'
      'Е'
    else
      letter
    end
  end

  def normalized_letters
    @letters_normalized = @letters.map { |letter| normalize_letter(letter) }
  end

  def over?
    won? || lost?
  end

  def play!(letter)
    unless over? || @user_guesses.include?(normalize_letter(letter))
      @user_guesses << normalize_letter(letter)
    end
  end

  def won?
    (@letters_normalized - @user_guesses).empty?
  end

  def word
    @letters.join
  end
end
