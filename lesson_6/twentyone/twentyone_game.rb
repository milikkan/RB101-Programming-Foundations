# constants
CARD_SUITS = ["H", "D", "C", "S"]
CARD_VALUES = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
WINNING_SCORE = 5
BUST_LIMIT = 21
DEALER_HIT_LIMIT = 17

# methods
def prompt(msg)
  puts "=> #{msg}"
end

def clear_screen
  system("clear") || system("cls")
end

def display_welcome
  puts "   WELCOME TO TWENTY-ONE   "
  puts "---------------------------"
end

def display_score(scores)
  puts
  prompt "SCORE (reach #{WINNING_SCORE} to win):"
  prompt "Player: #{scores[:player]} - Dealer: #{scores[:dealer]}"
  puts
end

def initialize_deck
  new_deck = {}
  CARD_SUITS.each do |suit|
    new_deck[suit] = Array.new(CARD_VALUES)
  end
  new_deck
end

def pick_a_card!(deck)
  suit = deck.keys.sample
  card = deck[suit].sample
  deck[suit].delete(card)
  [].push(suit, card)
end

def deal(deck, num_cards=2)
  hand = []
  num_cards.times do
    card = pick_a_card!(deck)
    hand.push(card)
  end
  hand
end

def total(cards)
  sum = 0
  values = cards.map { |card| card[1] }

  values.each do |value|
    sum += if value == "A"
             11
           elsif value.to_i == 0 # for J, Q, and K
             10
           else
             value.to_i
           end
  end
  # correction if number of Aces is more than 1
  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > BUST_LIMIT
  end

  sum
end

def busted?(total)
  total > BUST_LIMIT
end

def retrieve_player_choice
  answer = nil
  loop do
    answer = gets.chomp.downcase
    break if %w(hit h stay s).include?(answer)
    prompt "Invalid choice! Try again..."
  end
  answer
end

def sort_hand(cards)
  cards.sort_by { |card| card[1] }.reverse
end

def card_name(card)
  suits = {
    "H" => "Hearts",
    "D" => "Diamonds",
    "C" => "Clubs", "S" => "Spades"
  }
  special_cards = {
    "K" => "King",
    "Q" => "Queen",
    "J" => "Jack",
    "A" => "Ace"
  }

  suit = suits[card[0]]
  name = card[1]
  name = special_cards[card[1]] if special_cards.key?(card[1])
  "#{name} of #{suit}"
end

def display_dealer_hand(cards)
  sorted_cards = sort_hand(cards)
  prompt "Dealer has (#{card_name(sorted_cards[0])}) and (?)"
end

def display_hand(cards, who, total)
  sorted_cards = sort_hand(cards)
  msg = who == "dealer" ? "Dealer has " : "You have "
  sorted_cards.each do |card|
    msg += "(#{card_name(card)})"
    msg += " and " unless sorted_cards.last == card
  end
  msg += ". Total is #{total}."
  prompt msg
end

def detect_result(dealer_total, player_total)
  if player_total > BUST_LIMIT
    :player_busted
  elsif dealer_total > BUST_LIMIT
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_result(dealer_total, player_total)
  result = detect_result(dealer_total, player_total)

  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
end

def play_again?
  puts "=============="
  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

def detect_round_winner(dealer_total, player_total)
  result = detect_result(dealer_total, player_total)
  if result == :player_busted || result == :dealer
    :dealer
  elsif result == :dealer_busted || result == :player
    :player
  elsif result == :tie
    nil
  end
end

def detect_game_winner(scores)
  if scores[:dealer] == WINNING_SCORE
    "dealer"
  elsif scores[:player] == WINNING_SCORE
    "player"
  end
end

def game_won?(scores)
  !!detect_game_winner(scores)
end

def update_score!(scores, winner)
  scores[winner] += 1
end

def round_summary(dealer, dealer_total, player, player_total)
  puts "=============="
  puts "R O U N D  S U M M A R Y"
  puts "------------------------"
  display_result(dealer_total, player_total)
  display_hand(dealer, "dealer", dealer_total)
  display_hand(player, "player", player_total)
  puts "=============="
end

def display_next_round
  puts "Hit Enter to continue..."
  gets
end

loop do # main loop
  scores = { dealer: 0, player: 0 }
  dealer, dealer_total, player, player_total = nil

  loop do # round loop
    clear_screen
    display_welcome
    display_score(scores)
    deck = initialize_deck
    player = deal(deck)
    dealer = deal(deck)

    player_total = total(player)
    dealer_total = total(dealer)

    display_dealer_hand(dealer)
    display_hand(player, "player", player_total)
    puts
    # player turn
    loop do
      prompt "[H]it or [S]tay?"
      answer = retrieve_player_choice
      # player hits
      if %w(hit h).include?(answer)
        prompt "You chose to hit. Your hand now is:"
        player.push(pick_a_card!(deck))
        player_total = total(player)
        display_hand(player, "player", player_total)
        puts
      end

      break if %w(stay s).include?(answer) || busted?(player_total)
    end
    # player busted
    if busted?(player_total)
      round_summary(dealer, dealer_total, player, player_total)
      update_score!(scores, :dealer)
      break if game_won?(scores)
      display_next_round
      next
    else
      prompt "You chose to stay. Last total was #{player_total}."
      puts "=============="
    end

    # dealer turn
    loop do
      break if dealer_total >= DEALER_HIT_LIMIT
      prompt "Dealer chose to hit."
      dealer.push(pick_a_card!(deck))
      dealer_total = total(dealer)
      display_hand(dealer, "dealer", dealer_total)
    end
    # dealer busted
    if busted?(dealer_total)
      round_summary(dealer, dealer_total, player, player_total)
      update_score!(scores, :player)
      break if game_won?(scores)
      display_next_round
      next
    else
      puts "Dealer chose to stay. Last total was #{dealer_total}."
    end

    # at this point, both player and dealer should have stayed
    round_summary(dealer, dealer_total, player, player_total)
    round_winner = detect_round_winner(dealer_total, player_total)
    update_score!(scores, round_winner) if round_winner

    break if game_won?(scores)
    display_next_round
    next
  end # end round loop

  clear_screen
  display_welcome
  game_winner = detect_game_winner(scores)
  round_summary(dealer, dealer_total, player, player_total)
  prompt "GAME OVER. #{game_winner.capitalize} wins!"
  display_score(scores)
  break unless play_again?
end # end main loop

prompt "Thanks for playing TWENTY-ONE!"
