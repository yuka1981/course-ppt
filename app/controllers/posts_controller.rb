class PostsController < ApplicationController

  before_action :find_board, only: [:new, :create]
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def new
    @post = @board.posts.new
  end

  def show
  end

  def create
    @post = @board.posts.new(post_params)

    if @post.save
      redirect_to @board, notice: '文章新增成功'
    else
      
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to board_path(@post.board_id) , notice: 'updated!!'
    else
      
    end
  end

  def destroy
    @post.destroy
    redirect_to board_path(@post.board_id)
  end

  private
  def find_board
    @board = Board.find(params[:board_id])
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end