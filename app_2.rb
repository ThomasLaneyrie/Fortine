require_relative 'lib/player'
require_relative 'lib/human_player'

require 'pry'

puts "-------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"

puts "Quel est ton nom, humain ?"
human_player1 = HumanPlayer.new(gets.chomp)

player1 = Player.new("Josiane")
player2 = Player.new("José")
enemies = Array.new
enemies.push(player1, player2)

while human_player1.life_points > 0 && (player1.life_points > 0 ||  player2.life_points > 0)
  human_player1.show_state
  sleep 2

  # Choix du joueur
  puts "Quelle action veux-tu effectuer ?"
  puts "  a- chercher une meilleure arme"
  puts "  s- chercher à se soigner"
  puts "  Attaquer un joueur en vue :"
  print "   0- " 
  player1.show_state
  print "\n   1- "  
  player2.show_state
  print "\n Quel est ton choix ? "
  choix = gets.chomp
  puts "\n"
  
  case choix  
    when "a"
      human_player1.search_weapon
    when "s"
      human_player1.search_health_pack
    when "0"
      human_player1.attacks(player1)
    when "1"
      human_player1.attacks(player2)
    else 
      puts "Choix impossible ! Choix possibles a-s-0-1. Que veux-tu faire ?"
      print "> "
      choix = gets.chomp
  end

  if player1.life_points > 0 && player2.life_points > 0
    sleep 2
    puts "\nLes autres joueurs attaquent !\n"
    enemies.each do |player|
      sleep 2
      if player.life_points > 0
        player.attacks(human_player1)
      end
    end
  end
end

sleep 3
puts "\nLa partie est finie !"
sleep 2
if human_player1.life_points >= 0
  puts "BRAVO ! TU AS GAGNE !"
else
  puts "Loser ! Tu as perdu !"
end

binding.pry