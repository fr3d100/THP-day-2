class GossipsController < ApplicationController

	 def index	
  	@gossips = Gossip.all.reverse_order
  	puts Gossip.all
  end
   
   def show
  	@gossip = Gossip.find(params['id'])
  	puts @gossip
  end

  def new
  	
  end

  def create
  	g = Gossip.new
  	g.title = params['gossip_title']
  	g.content = params['gossip_content']
  	g.user = User.first
  	g.save
  	redirect_to gossips_path
  end

end
