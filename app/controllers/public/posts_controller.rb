class Public::PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to post_path(@post)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments_count = Comment.where(post_id: @post.id).count
    @goods_count = Good.where(post_id: @post.id).count
  end

  private
  def post_params
    params.require(:post).permit(:postimage, :title, :body)
  end
end
