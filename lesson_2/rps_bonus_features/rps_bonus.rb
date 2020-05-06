require 'yaml'

VALID_CHOICES = %w(rock paper scissors spock lizard)
ABBREVIATED_CHOICES = %w(r p sc sp l)

WINNING_RULES = {
  rock: ['lizard', 'scissors'],
  paper: ['rock', 'spock'],
  scissors: ['paper', 'lizard'],
  spock: ['scissors', 'rock'],
  lizard: ['paper', 'spock']
}

WINNING_MESSAGES = YAML.load_file('winning_messages.yml')

def clear_screen
  system("clear") || system("cls")
end

def prompt(message)
  puts "=> #{message}"
end

def valid_choice?(choice)
  VALID_CHOICES.include?(choice) || ABBREVIATED_CHOICES.include?(choice)
end

def convert_to_long_choice(choice)
  index = ABBREVIATED_CHOICES.index(choice)
  if index
    VALID_CHOICES[index]
  else
    choice
  end
end

def retrieve_choice
  loop do
    choice_prompt = <<-MSG
Choose one, you can type abbreviations:
    * Rock (r)
    * Paper (p)
    * Scissors (sc)
    * Spock (sp)
    * Lizard (l)
MSG
    prompt(choice_prompt)
    choice = gets.chomp.strip.downcase

    break convert_to_long_choice(choice) if valid_choice?(choice)
    prompt("That's not a valid choice.")
  end
end

def determine_winner(first, second)
  if first == second
    'tie'
  elsif WINNING_RULES[first.to_sym].include?(second)
    'player'
  else
    'computer'
  end
end

def display_winner(player, computer)
  prompt("You chose: #{player.upcase}; Computer chose: #{computer.upcase}")
end

def display_winning_message(winner, player, computer)
  return if winner == 'tie'

  if winner == 'player'
    winner_choice = player
    loser_choice = computer
  else
    winner_choice = computer
    loser_choice = player
  end

  prompt(WINNING_MESSAGES[winner_choice][loser_choice])
end

def display_round_result(who='tie')
  case who
  when 'player' then prompt('You won this round!')
  when 'computer' then prompt('Computer won this round!')
  else prompt('It is a tie!')
  end
end

def display_game_result(player)
  if player == 5
    puts "You won the game"
  else
    puts "Computer won the game"
  end
end

def retrieve_new_game_answer
  loop do
    prompt('Do you want to play again? (enter y/yes or n/no)')
    answer = gets.chomp.downcase
    break answer if %w(y yes n no).include?(answer)
    prompt("Invalid input...Enter y/yes to play again, n/no to stop.")
  end
end

clear_screen
first_game = true

loop do # main game loop
  clear_screen unless first_game

  player_score = 0
  computer_score = 0

  while player_score < 5 && computer_score < 5
    choice = retrieve_choice
    computer_choice = VALID_CHOICES.sample

    winner = determine_winner(choice, computer_choice)

    display_winner(choice, computer_choice)
    display_winning_message(winner, choice, computer_choice)
    display_round_result(winner)

    player_score += 1 if winner == 'player'
    computer_score += 1 if winner == 'computer'

    prompt("Player: #{player_score} - Computer: #{computer_score}")
    puts ""
  end

  display_game_result(player_score)

  answer = retrieve_new_game_answer
  break unless %w(y yes).include?(answer)

  first_game = false
end # end main loop

prompt('Thank you for playing. Good bye!')
