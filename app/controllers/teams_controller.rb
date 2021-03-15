class TeamsController < ApplicationController
  
  def new
    @league = League.find(params[:league_id])
    @team = Team.new
  end

  def show
    @team = Team.find(params[:id])
  end

  def create
    @league = League.find(params[:league_id])

    coordinator_id = User.find_by(username: team_params[:coordinator]).id
    new_team_params = team_params.except(:coordinator)
    new_team_params[:user_id] = coordinator_id
    @team = @league.teams.create(new_team_params)
    
    redirect_to league_path(@league)
  end

  def edit
    @league = League.find(params[:league_id])
    @team = Team.find(params[:id])
  end
    
  def destroy
    @league = League.find(params[:league_id])
    @team = @league.teams.find(params[:id])
    if @team.destroy
      redirect_to league_path(@league)
    else 
      render :show
    end
  end
    
  private
    def team_params
      params.require(:team).permit(:name, :icon, :coordinator, :user_id)
  end  

end
