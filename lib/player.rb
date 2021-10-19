 require 'pry'

 class Player

#attribut des joueurs 

   attr_accessor :name, :life_points, :lost_point

#méthode qui va donner le nom et les points de vies initiaux

 def initialize (player_name)

 	@name = player_name
 	@life_points = 10 

 end

 #méthode pour afficher l'état des joueurs 

 def show_state

 	puts "#{@name} a #{@life_points} points de vie"

 end

#méthode pour baisser le niveau de vie quand le joueur subit une attaque 

 def gets_damage (damage)

 	@life_points -= damage

 	if @life_points <= 0 
 		puts "oooooh noooo ! #{@name} est game over"
 	end 
 	
 end

 #méthode pour faire attaquer un joueur 

 def attacks (player_name)

 	puts "le joueur #{@name} attaque le joueur #{player_name.name}"
 	 @lost_point = compute_damage
 	puts "il lui inflige #{@lost_point} points de dommages !!"

 	player_name.gets_damage(lost_point) #appel la méthode damage pour faire subir l'attaque 
    
 end


 #méthode qui va faire le calcul des dommages subits 

 def compute_damage

 	return rand(1..6) #permet de séléctionner un chiffre de manière aléatoire
 	
 end

binding.pry
puts "end of file"
 end 

 class HumanPlayer < Player #permet de dire que cette class hérite de la class Player (c'est en quelques sorte une class additionnel)

   attr_accessor :weapon_level, :New_weapon, :healt_pack #définit sous forme de chiffre le niveau de l'arme du joueur humain 

   def initialize (player_name)

      @name = player_name
      @life_points = 100
      @weapon_level = 1 
      
   end

   def show_state

      puts " Salut #{name} ! niveau de vie : #{@life_points}, niveau arme : #{@weapon_level} "

   end

   def compute_damage

      return rand(1..6) * weapon_level
      
   end

   def search_weapon

      @New_weapon = rand(1..6) 
      puts "Félicitation ! Tu as trouvé une arme de niveau #{@New_weapon}"
   
      if @New_weapon > @weapon_level
           @weapon_level = @New_weapon
         puts "Nouvelle Arme débloquée, tu peux maintenant l'utiliser"
      else @New_weapon <= @weapon_level
         puts "m@&*~~~ elle ne vaut pas mieux que ton arme ! jette la"
      end 
   end

   def search_health_pack
      @healt_pack = rand(1..6)

      if @healt_pack == 1 
         puts "Dommage tes recherches n'ont pas été fructuantes !"
      elsif @healt_pack >= 2 && @healt_pack <= 5
         puts "Pack de 50 points de vie trouvé"
         if @life_points <= 50
         @life_points += 50
         puts " +50 points de vie"
      end
      elsif @healt_pack == 6
         puts "WAAAOUU ! Pack de 80 points de vie trouvé"
         if @life_points <= 20
            @life_points += 80 
            puts " +80 points de vie"
         end
      end 
   end




binding.pry
puts "end of file"
end

