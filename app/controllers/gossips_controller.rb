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
  	@gossip = Gossip.last
  end

  def create
  	@gossip = Gossip.new
  	@gossip.title = params['gossip_title']
  	@gossip.content = params['gossip_content']
  	@gossip.user = User.last

  	if @gossip.save # essaie de sauvegarder en base @gossip
  		redirect_to gossips_path
	  else
	     render :template => 'gossips/new'# sinon, il render la view new (qui est celle sur laquelle on est déjà)
	  end

  end

end
