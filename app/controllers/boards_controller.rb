class BoardsController < ApplicationController

  layout 'application'
  # app/views/layouts/boards.html.erb
  # app/views/layouts/application.html.erb

  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    # Board.create(title: params[:title], intro: params[:intro])

    if @board.save
      # 分段寫的話，:notice 這個 key 可以自訂
      # flash[:notice] = "新增成功"
      # redirect_to root_path

      # 只有 :notice / :alert
      redirect_to boards_path, notice: "新增成功"
    else
      # NG
    end

    # reander(html: params)
    # render html: params
  end

  private
  # Strong Parameters
  def board_params
    params.require(:board).permit(:title, :intro)
  end
end
