class PostsController < ApplicationController

  before_action :authorized_admin?, except: [:index, :show]
  before_action :get_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    elsif
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    # can use post params?
    if @post.update(params[:post].permit(:title, :body))
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

private
#how to access these indivudially?
  def post_params
    params.require(:post).permit(:title, :body)
  end

  def get_post
    @post = Post.find_by(id: params[:id])
    not_found if @post.nil?
    @post
  end

  def ensure_post
    not_found unless get_post != nil
  end
end