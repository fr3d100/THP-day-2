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
  		flash[:success] = "Potin créé avec succès!"
      redirect_to gossips_path
	  else
      flash[:danger] = []
      @gossip.errors.full_messages.each do |message|
        flash[:danger] << message
      end
      flash[:danger] = flash[:danger].join(" & ")

      redirect_to new_gossip_path
    end

  end

end
