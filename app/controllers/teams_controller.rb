class TeamsController < ApplicationController
  before_action :set_team, only: %i[ show edit update destroy ]


  def index
    @teams = Team.all
  end

  def show
    
  end

  def new
    @team = Team.new
  end

  def edit
  end

  def create
    @team = Team.new(team_params)
    authorize @team
    if @team.save
      redirect_to team_url(@team), notice: "Team was successfully created." 
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    authorize @team
    if @team.update(team_params)
      redirect_to team_url(@team), notice: "Team was successfully updated." 
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    Game.where(team_1_id:@team.id).or(Game.where(team_2_id:@team.id)).destroy_all
    authorize @team
    @team.destroy
    redirect_to teams_url, notice: "Team was successfully destroyed." 
  end

  private
    def set_team
      @team = Team.find(params[:id])
    end

    def team_params
      params.require(:team).permit(:team_name,  :tournament_id)
    end
end
