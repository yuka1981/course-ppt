class PostsController < ApplicationController

  before_action :find_board, only: [:new, :create]
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:show]


  def new
    @post = @board.posts.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
      @post = @board.posts.new(post_params)  # 少了 user_id
      # @post.user = current_user

      if @post.save
        redirect_to @board, notice: '文章新增成功'
      else
        render :new
      end
  end

  def edit
    # @post = Post.find_by(id: params[:id], user: current_user)
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])

    if @post.update(post_params)
      redirect_to @post, notice: '文章更新成功'
      # redirect_to board_path(@post.board_id) , notice: 'updated!!'
    else
      render :edit
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

  # strong parameters
  def post_params
    params.require(:post)
          .permit(:title, :content)
          .merge(user: current_user) 
          # hash
          # 有 belongs_to 就可以用 :user
          # 不用！方法是因為這邊只要回傳值 而不是 改變原本的的資料
  end
end