class GossipsController < ApplicationController

	 def index	
  	@gossips = Gossip.all
  	puts Gossip.all
  end
   
   def show
  	@gossip = Gossip.find(params['id'])
  	puts @gossip
  end

end
