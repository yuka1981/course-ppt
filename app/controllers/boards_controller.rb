class BoardsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def not_found
    render file: '/public/404.html', status: 404
  end

  layout 'application'
  # app/views/layouts/boards.html.erb
  # app/views/layouts/application.html.erb

  def index
    @boards = Board.all
  end

  def show
    # return array, 多筆資料
    # Board.where(id: params[:id]) 
    
    # return "single" value, 只會找到第一筆
    # Board.find_by(id: params[:id]) # 可以接其它欄位或 hash, 找不到 retrun nil
    @board = Board.find(params[:id]) # 只能接 pk, 找不到 return ActiveRecord::RecordNOtFound

    # select * from boards where id = ?
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

      # redirect_to new_board_path, notice: "發生錯誤"
      render :new
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