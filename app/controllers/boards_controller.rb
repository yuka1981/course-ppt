class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def new

  end

  def create
    # reander(html: params)
    render html: params
  end

end
