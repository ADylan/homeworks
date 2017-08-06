class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      take_turn
      system("clear")
    end
  end

  def take_turn
    show_sequence
    require_sequence

    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color
      system("clear")
    end
  end

  def require_sequence
    puts "Repeat the sequence by entering the first letter of each color on a new line"
    @seq.each do |color|
      user_color = gets.chomp
      if color[0] != user_color
        @game_over_message = true
        break
      end
    end
  end

  def add_random_color
    @seq << COLORS.shuffle[0]
  end

  def round_success_message
    "Round successful."
  end

  def game_over_message
    puts "Game over"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
