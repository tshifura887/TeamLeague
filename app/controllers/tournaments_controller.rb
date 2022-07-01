class TournamentsController < ApplicationController
    before_action :set_tournament, only: %i[show edit update destroy]
    
    def index
        @tournaments = Tournament.all
    end
    
    def show 
        @games = @tournament.games
    end
    
    def new
        @tournament = Tournament.new()
    end
  
    def create
        @tournament = Tournament.new(tournament_params)
      
        if @tournament.save
            redirect_to @tournament
        else
            render :new, status: :unprocessable_entity
        end
  
        total_points = PointsService.new
        @points = total_points.call
        @points = @points[0..@tournament.number_of_teams-1]
        while @points.length > 0
            @tournament.games.create(team_1_id: @points[0][0], team_2_id: @points.last[0])
            @points.shift
            @points.pop
        end
    end
    
    def update
        if @tournament.update(tournament_params)
            redirect_to @tournament
        else
            render :edit, status: :unprocessable_entity
        end
    end
    
    def destroy
        @tournament.destroy
        redirect_to tournaments_path
    end
    
    private
    def set_tournament  
        @tournament = Tournament.find(params[:id])
    end
    
    def tournament_params
        params.require(:tournament).permit(:title, :number_of_teams)
    end
end