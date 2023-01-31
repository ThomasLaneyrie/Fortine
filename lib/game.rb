class Game
  attr_accessor :human_player, :players_left, :enemies_in_sight
  def initialize(name, number_ennemies)
    @human_player = HumanPlayer.new(name)
    @players_left = number_ennemies
    @enemies_killed = 0
    @enemies_in_sight = Array.new
  end

  def dice
    return rand(1..6)
  end

  def new_players_in_sight
    if @players_left == (@enemies_killed + @enemies_in_sight.length)
      puts "Tous les ennemis possibles sont déjà apparus !"
    else
      de = dice
      if de == 1
        puts "Pas de nouveau ennemis en vue !"
      elsif de == 2 || de == 3 || de == 4  
        @enemies_in_sight.push(Player.new("Player#{rand(1..10000)}"))
        puts "Un nouvel ennemi est en vue ! Voici son nom : #{@enemies_in_sight.last.name}"
      elsif de == 5 || de == 6
        puts "2 nouveaux ennemis en vue !"
        @enemies_in_sight.push(Player.new("Player#{rand(1..10000)}"))
        puts "Le 1er : #{@enemies_in_sight.last.name}"
        @enemies_in_sight.push(Player.new("Player#{rand(1..10000)}"))
        puts "Le 2eme : #{@enemies_in_sight.last.name}"
      end
    end
  end

  def kill_player(player_killed)
    @enemies_in_sight.delete_if{|player| player.name.include? player_killed.name}
    @enemies_killed += 1
  end

  def is_still_ongoing?
    if @human_player.life_points > 0 && @enemies_killed != @players_left
      return true
    else 
      return false
    end
  end

  def show_players
    @human_player.show_state
    sleep 1
    puts "Nombre d'ennemis en vue : #{@enemies_in_sight.length}"
    puts "Nombre d'ennemis tués : #{@enemies_killed}"
    sleep 1
  end

  def menu
    numero = 0
    puts "Quelle action veux-tu effectuer ?"
    puts "  a- chercher une meilleure arme"
    puts "  s- chercher à se soigner"
    puts "  Attaquer un joueur en vue :"
    @enemies_in_sight.each do |player|
      print "   #{numero}- "
      player.show_state
      print "\n"
      numero += 1
    end
    print "\n Quel est ton choix ? "
  end

  def menu_choice(choix)
    sleep 1
    case choix  
      when "a"
        @human_player.search_weapon
      when "s"
        @human_player.search_health_pack
      when "0"..((@enemies_in_sight.length)-1).to_s
        @human_player.attacks(@enemies_in_sight[choix.to_i])
        if @enemies_in_sight[choix.to_i].life_points <= 0 
          kill_player(@enemies_in_sight[choix.to_i])
        end
      else 
        puts "Choix impossible ! Choisi à nouveau :)"
        print "> "
        menu_choice(gets.chomp)
    end
  end

  def enemies_attack
    @enemies_in_sight.each do |player|
      sleep 0.2
      player.attacks(@human_player)
    end
  end

  def menu_end
    sleep 2
    puts "\n####################### !! La partie est finie !! #############################"
    sleep 2
    if @human_player.life_points >= 0
      puts "\nBRAVO ! TU AS GAGNE !"
    else
      puts "\nLoser ! Tu as perdu !"
    end
  end
end