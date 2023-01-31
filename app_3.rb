require_relative 'lib/player'
require_relative 'lib/human_player'
require_relative 'lib/game'

require 'pry'
require 'colorize'

puts "------------------------------------------------------------------------------"
puts "|              Bienvenue sur 'ILS VEULENT TOUS MA POO' !                     |"
puts "|              Le but du jeu est d'être le dernier survivant !               |"
puts "------------------------------------------------------------------------------"
puts "Quel est ton nom, humain ?"
name_player = gets.chomp
sleep 1
puts "#{name_player} ? Quel drôle de nom. Tu vas pas aller bien loin toi ..."
sleep 1

puts "Contre combien d'ennemis souhaites-tu montrer toute l'étendue de tes skills ?"
game1 = Game.new(name_player, gets.chomp)

puts "Okay moussaillon...c'est partie !"
while game1.is_still_ongoing? == true
  puts "\n"
  puts "####################### !! Continue à avancer !! ##############################".red
  gets.chomp
  game1.new_players_in_sight
  gets.chomp
  game1.menu
  game1.menu_choice(gets.chomp)
  gets.chomp
  game1.enemies_attack
  puts "\n"
  game1.show_players
end

game1.menu_end
binding.pry