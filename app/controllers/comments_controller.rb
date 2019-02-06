class CommentsController < ApplicationController
	
	def create
		@comment = Comment.new
		user = User.order("RANDOM()").first
		gossip = Gossip.find(params['gossip_id'])
		puts gossip.id
		@comment.user = user
		@comment.gossip = gossip
		@comment.content = params['comment_content']

		if @comment.save 
			redirect_to gossip_path(@comment.gossip.id)
		else
			redirect_to gossip_path(@gossip.id)
		end
	end

	 def destroy
	 	puts 'On est bien dans le destroy des comments'
	 	puts params
    @comment = Comment.find(params['id'])
    if @comment.destroy
      flash[:success] = "Le commentaire a bien été delete!"
      redirect_to gossip_path(params['gossip_id'])
    else
      flash[:danger] = "Le potin n'a pas été supprimé ..."
      redirect_to root_path
    end
  end

end
