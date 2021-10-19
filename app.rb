require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("José")

 def fight (player1,player2)

 while player1.life_points > 0 && player2.life_points >0 do 

 	puts " ___________________________"
 	puts " "
 	
 	puts "Voici l'état de chaque joueur :"
 	puts " "
 	 
 	 player1.show_state
 	 player2.show_state

 	puts " ___________________________ "
 	puts " "
 		
 	puts "1..2..3 FIGHT"

 	puts " "

 	player1.attacks(player2)

 	puts " ............. "

 	break if player2.life_points <= 0
 	puts " "

 	player2.attacks(player1)

     end

 end

 binding.pry
