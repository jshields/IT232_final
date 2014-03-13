class CommentsController < ApplicationController
	def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create!(params.require(:comment).permit!)
        redirect_to @post
    end

	# DELETE /comments/1
  	# DELETE /commentss/1.json
    def destroy
      @post = Post.find(params[:post_id])
      @comment = Comment.find(params[:id])
    	@comment.destroy
   		respond_to do |format|
      		format.html { redirect_to @post }
      		format.json { head :no_content }
    	end
  	end

    def comment_params
    	 params.require(:comment).permit(:body)
    end
end
