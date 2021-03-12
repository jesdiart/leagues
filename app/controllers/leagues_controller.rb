class LeaguesController < ApplicationController

  def index
    @leagues = League.all
  end

  def show
    @league = League.find(params[:id])
  end

  def new
    @league = League.new
  end

  def create
    @user = User.find_by(username: league_params[:manager_username])
    new_league_params = league_params.except(:manager_username)
    new_league_params[:manager_id] = @user.id
    @league = League.new(new_league_params)

    if @league.save
      redirect_to @league
    else
      render :new
    end
  end

  def edit
    @league = League.find(params[:id])
  end

  def update
    @league = League.find(params[:id])
    @user = User.find_by(username: league_params[:manager_username])
    edit_league_params = league_params.except(:manager_username)
    edit_league_params[:manager_id] = @user.id unless @user.nil?

    if @league.update(edit_league_params)
      redirect_to @league
    else
      render :edit
    end
  end

  def destroy
    @league = League.find(params[:id])
    if @league.destroy
      redirect_to root_path
    else 
      render :show
    end
  end

  private
    def league_params
      params.require(:league).permit(:name, :sport, :manager_username, :manager_id)
    end
end
