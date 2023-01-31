require 'pry'

class Player
  attr_accessor :name, :life_points
 
  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    print "#{@name} a #{@life_points} points de vie"
  end

  def gets_damage(damages)
    @life_points -= damages
    if @life_points <= 0
      "Le jour #{name} a été tué (Gros nul)"
    end
  end

  def attacks(player_under_attack)
    puts "> #{name} attaque #{player_under_attack.name}"
    damages_done = compute_damage
    player_under_attack.gets_damage(damages_done)
    puts "Et lui inflige #{damages_done} points de dommages !"
  end

  def compute_damage
    return rand(1..6)
  end
end

