class MartaController < ApplicationController
 		def index
 
 				trains = HTTParty.get("http://developer.itsmarta.com/RealtimeTrain/RestServiceNextTrain/GetRealtimeArrivals?apikey=#{ENV['marta_api_key']}")
		
				@stations = []
 
				trains.each do |t|
 	  		@stations.push(t["STATION"])
 	  	end
 	
 	  	@stations.sort!
 	  	@stations.uniq!
 
 	  	if params[:station] != nil
  		
   		@arriving_trains = []
 
 	  		trains.each do |t|
 	  			if t["STATION"] == params[:station]
 	  				@arriving_trains.push(t)
 	  			end
 	  		end
 	  	end
 	  end
	end