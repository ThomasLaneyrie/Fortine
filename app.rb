require_relative 'lib/player'

require 'pry'
require 'colorize'

player1 = Player.new("Josiane")
player2 = Player.new("José")

while player1.life_points > 0 || player2.life_points > 0
  puts "Voici l'état de chaque joueur :"
  player1.show_state
  puts "\n"
  player2.show_state
  puts "\n"
  puts "\nPassons à la phase d'attaque"
  player1.attacks(player2)
  if player2.life_points <= 0
    puts "Le joueur #{player2.name} a été tué !"
    break
  end
  player2.attacks(player1)
  if player1.life_points <= 0
    puts"Le joueur #{player1.name} a été tué !"
    break
  end
  puts "\n"
end

puts "Fin du combat !"