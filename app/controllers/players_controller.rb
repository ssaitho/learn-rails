class PlayersController < ApplicationController
  before_action :set_player, only: [:edit, :update, :destroy]

  def index
    @players = Player.all
    # :searchが空文字列でない場合
    keyword = params[:search]
    if keyword.present?
      search_term = "%#{keyword}%"
      @players = Player.where("id LIKE :search OR created_at LIKE :search OR name LIKE :search OR age LIKE :search OR birthday LIKE :search OR height LIKE :search OR weight LIKE :search OR hometown LIKE :search OR pitching_and_batting LIKE :search", search: "%#{keyword}%")
    end
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)

    if @player.save
      redirect_to players_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @player.update(player_params)
      redirect_to players_path
    else
      render :edit
    end
  end

  def destroy
    @player.destroy
    redirect_to players_path
  end

  # player_paramsはこのclassでしか呼び出せなくなる
  private

  def player_params
    params.require(:player).permit(:name, :age, :birthday, :height, :weight, :hometown, :pitching_and_batting)
  end

  def set_player
    @player = Player.find(params[:id])
  end
end
