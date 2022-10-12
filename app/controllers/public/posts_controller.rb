class Public::PostsController < ApplicationController
   before_action :authenticate_user!, except: [:index]
   before_action :correct_post,only: [:edit]
   before_action :set_post, only: [:edit, :update, :show]

  def index
    @posts = Post.all.page(params[:page]).per(12)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to user_path(post.user_id)
  end

  def show
    @comment = Comment.new
    @comments = Comment.where(post_id: @post.id)
  end

  private
  def post_params
    params.require(:post).permit(:postimage, :title, :body)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
