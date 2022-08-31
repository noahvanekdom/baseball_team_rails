class TeamPlayersController < ApplicationController

  def index
    @team = Team.find(params[:id])
    @players = @team.players
  end

  def new
    @team = Team.find(params[:team_id])
  end

  def create
    @team = Team.find(params[:team_id])
    @player = @team.players.create!(player_params)
    redirect_to "/teams/#{@team.id}"
  end

  private

  def player_params
    params.permit(:name, :obp, :slg, :rule_5_elig, :handed)
  end
end
