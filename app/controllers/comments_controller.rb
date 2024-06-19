class CommentsController < ApplicationController
    before_action :require_user
    def create
      @comment = Comment.new(comment_params)
  
      if @comment.save
        redirect_to post_path(@comment.post), notice: 'Comment Created Successfully'
      else
        redirect_to post_path(@comment.post), notice: 'Unsccessful! Comment Not Created'
      end
  
      # redirect_to posts_path
    end


    def destroy
        @comment =  Comment.destroy(params[:id])
        redirect_to post_path(@comment.post), notice: "Comment deleted successfully"
     
     
    end



    def edit
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
    end



    def update
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
    
        if @comment.update(comment_params)
          redirect_to post_path(@post), notice: 'Comment updated successfully'
        else
          redirect_to root_path, notice: 'error  in updating'
        end
      end


    private
  
    def comment_params
        params.require(:comment).permit(:body).merge(post_id: params[:post_id], user_id: current_user.id,)
    end


  end



  