# 1. Create the deck of cards.  52 cards total.  4 of everything except 10 value cards.  Should we make them J, Q, K, A? or just all values?  
# 2. Create players.  1 is the dealer, and 1 is the player.  Both bust on 22 or higher, dealer must hit to at least 17.
# 3. Create a hand.  Player is dealt first, then dealer.  Both get 2 cards but 1 of dealer is face down.
# 4. Player can hit or stay.  Hit gets another card, loop hit or stay again.  Evaluate to 22 or greater for bust.
# 5. Computer can hit or stay.  If below 17, must hit.  If above 17 must stay, even after a hit.  Evaluate to 22 or greater for bust
# 6. Evaluate to winner
# 7. Ask to play again

require 'pry'


puts "Welcome to Black Jack!"

deck_of_cards =[]

suits = ['H', 'D', 'C', 'S']
cvalue = ['2', '3', '4', '5', '6', '7', '8', '9', '10',]
deck_of_cards = suits.product(cvalue)
deck_of_cards.shuffle!

#First Deal

player_cards = []
computer_cards = []

player_cards << deck_of_cards.pop
computer_cards << deck_of_cards.pop
player_cards << deck_of_cards.pop
computer_cards << deck_of_cards.pop

# Hit or Stay Decision by Player

puts " Dealer Is Showing: #{computer_cards[1]}"
puts ""
puts " Your Cards Are: #{player_cards}" "They total  #{(player_cards.map{|c| c[1].to_i}).inject(:+)}"
puts ""
puts "What Would You Like To Do? Hit(H) or Stay(S)"
decision = gets.chomp

# Decision Logic

if decision == "H" || decision == "h"
  begin
  player_cards << deck_of_cards.pop
  puts " Dealer Is Showing: #{computer_cards[1]}"
  puts ""
  puts " Your Cards Are: #{player_cards} They total  #{(player_cards.map{|c| c[1].to_i}).inject(:+)}"
  puts ""
    if ((player_cards.map{|c| c[1].to_i}).inject(:+)) < 21
    puts "What Would You Like To Do? Hit(H) or Stay(S)"
    decision = gets.chomp
    else
    puts "You Busted!"
    end
  end while decision == "H" || decision == "h" && ((player_cards.map{|c| c[1].to_i}).inject(:+)) < 21 
end
 
# Dealer Hand Logic

if ((player_cards.map{|c| c[1].to_i}).inject(:+)) < 21 && ((computer_cards.map{|c| c[1].to_i}).inject(:+)) < 17  
  begin 
    computer_cards << deck_of_cards.pop
    puts "Dealer Now Has #{computer_cards}"
  end while ((computer_cards.map{|c| c[1].to_i}).inject(:+)) < 17
  else
     puts "Dealer Stays"
end

# Determine Hand Winner

puts ""
puts " Dealer Cards Are: #{computer_cards}"
puts ""
puts " Your Cards Are: #{player_cards}"
puts ''
puts "The Dealer Has #{(computer_cards.map{|c| c[1].to_i}).inject(:+)}"
puts "You Have #{(player_cards.map{|c| c[1].to_i}).inject(:+)}"


if (computer_cards.map{|c| c[1].to_i}).inject(:+) > 21
  puts "Dealer Busts, You Win! "
elsif (computer_cards.map{|c| c[1].to_i}).inject(:+) > (player_cards.map{|c| c[1].to_i}).inject(:+)
  puts "Sorry, Dealer Won"
else
  puts "Congrats, You Won!"
end



