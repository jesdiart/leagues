class TeamPlayersController < ApplicationController
  
  def index
    @team = Team.find(params[:team_id])
    @players = Player.joins(:team_players).where(team_players: {team_id: params[:team_id]})
  end

  def new
    @league = League.find(params[:league_id])
    @team = Team.find(params[:team_id])
    @player = Player.new
    @team_player = TeamPlayer.new
  end

  def create
    @league = League.find(params[:league_id])
    @team = Team.find(params[:team_id])
    @player = Player.create!(player_params)
    @team_player = TeamPlayer.create!(team_id: @team.id, player_id: @player.id)
    
    redirect_to league_team_path(@league, @team)
  end

  private
    def player_params
      params.require(:player).permit(:first_name, :last_name, :email, :photo)
    end

end
