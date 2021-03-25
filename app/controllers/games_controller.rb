class GamesController < ApplicationController
  
  def new
    @league = League.find(params[:league_id])
    @game = Game.new
  end

  def show
    @game = Game.find(params[:id])
  end

  def create
    @league = League.find(params[:league_id])
    @game = @league.games.create!(game_params)
    
    redirect_to league_path(@league)
  end
    
  private
    def game_params
      params.require(:game).permit(:date_and_time, :local_team_id, :local_score, :away_team_id, :away_score)
    end  

end
