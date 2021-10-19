require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

 puts " _______________________________"
 puts "                                "
 puts "|     BIENVENUE sur 'MA POO'    |"
 puts "| Le but du jeu est de survivre |"
 puts " |||||||||||||||||||||||||||||||"
 puts " |||||||||||||||||||||||||||||||" 
 puts "                                "


  #initialisation des joueurs humains 

  puts "Nom du joueur : "
  player_name = gets.chomp 
  puts "Bienvenu #{player_name}"
  user = HumanPlayer.new(player_name)

  #initialisation des ennemis 

  player1 = Player.new("Josiane")
  player2 = Player.new("José")
  Ennemis_array = Array.new 
  Ennemis_array << player1 << player2

  	while (player1.life_points > 0 || player2.life_points > 0) && user.life_points > 0

  		puts "*****************"
  		puts "Voici ton état : "
  		puts " "
  		user.show_state

  		puts " "
  		puts "*****************"

  		puts "A toi de jouer

  		      a - chercher une meilleure arme
  		      s - chercher à se soigner

  		      attaquer un joueur en vue :

  		      0 - josiane a #{player1.show_state}
  		      1 - josé a #{player2.show_state}"

  		case gets.strip
  		when "a"
  			user.search_weapon
  		when "s"
  			user.search_health_pack
  		when "0"
  			user.attacks(player1)
  		when "1"
  			user.attacks(player2)
  		end

    puts " "
    puts " Les autres joueurs attaquent"

    Ennemis_array.each do |player|

    	break if player.life_points <= 0 

    	player.attacks(user)

    end

  	puts "Fin du Game"

  	if user.life_points > 0

  		puts " "

  		puts " CONGRATULATION !! You survived !! "

  	else user.life_points < 0

  		puts " "

  		puts " You are dead x "
  	end
  	
  end





