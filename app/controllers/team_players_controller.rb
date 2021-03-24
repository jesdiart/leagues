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

  def assign
    @league = League.find(params[:league_id])
    @team = Team.find(params[:team_id])
    @player = Player.new
    @team_player = TeamPlayer.new
  end

  def create
    @league = League.find(params[:league_id])
    @team = Team.find(params[:team_id])
    if (player_params.has_key?(:player_id))
      @player = Player.find(player_params[:player_id])
    else 
      @player = Player.create!(player_params)
    end
    
    @team_player = TeamPlayer.create!(team_id: @team.id, player_id: @player.id)
    
    redirect_to league_team_path(@league, @team)
  end

  def destroy
    @league = League.find(params[:league_id])
    @team = Team.find(params[:team_id])
    @team_player = TeamPlayer.find_by(player_id: params[:id])
    @team_player.destroy!
    redirect_to league_team_path(@league, @team)
  end

  private
    def player_params
      params.require(:player).permit(:player_id, :first_name, :last_name, :email, :photo)
    end

end
