class PlayersController < ApplicationController

  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
  end

  def new
    @player = Player.new
  end

  private
    def player_params
      params.require(:player).permit(:first_name, :last_name, :email, :photo)
    end

end
