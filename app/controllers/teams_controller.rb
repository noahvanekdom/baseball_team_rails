class TeamsController < ApplicationController

  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
  end

  def create
    team = Team.create!(team_params)
    redirect_to "/teams"
  end

  private
  def team_params
    params.permit(:city, :team_name, :win_percent, :division_leader)
  end
end
