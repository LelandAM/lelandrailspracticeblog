class CommentsController < ApplicationController

  before_action :authorized_admin?, only: [:destroy]
  before_action :authorized_user?, only: [:create]
  before_action :get_post, only: [:create, :destroy]

  def create
    @comment = @post.comments.create(params[:comment].permit(:name, :body))
    redirect_to post_path(@post)
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private
  def get_post
    @post = Post.find(params[:post_id])
  end

end