class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    super(name)
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}\n\n".green
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    sleep 0.5
    new_arme = dice
    puts "Tu as trouvé une arme de niveau #{new_arme}"
    if new_arme > @weapon_level
      @weapon_level = new_arme
      if @weapon_level == 2 || @weapon_level == 3 || @weapon_level == 4
        puts "Une mitraillette des années 30...c'est pas la folie...mais ca fera l'affaire"
      elsif @weapon_level == 5 || @weapon_level == 6
        puts "Youhou ! Quelle belle sulfateuse !! Elle est meilleure que ton arme actuelle : tu la prends\n\n"
      end
    else
      puts "Et m*****... une arme aussi pourrie que ton couteau mal aiguisé...\n\n"
    end
  end

  def search_health_pack
    sleep 0.5
    search_pack_dice = dice
    if search_pack_dice == 1
      puts "Tu n'as rien trouvé ...\n\n"
    elsif search_pack_dice >=2 && search_pack_dice <= 5
      puts "Bravo, tu as trouvé un pack de +50 points de vie\n\n"
      @life_points += 50
    elsif search_pack_dice == 6
      puts "Waow, tu as trouvé un pack de +80 points de vie !\n\n"
      @life_points += 80
    end
  end

  def dice
    return rand(1..6)
  end
end
