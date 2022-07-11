class GamesController < ApplicationController
    before_action :set_game, only: %i[show edit update destroy]

    def index
        @games = Game.all
        points_service = PointsService.new
        @points = points_service.call
    end

    def show
        # @game = Game.find(params[:id])
    end

    def new
        @game = Game.new()
    end

    def create
        @game = Game.new(game_params)
        authorize @game
        if @game.save
            redirect_to games_path
       else 
            render :new, status: :unprocessable_entity
       end
    end

    def edit
    
    end

    def update
        
        authorize @game
        if @game.update(game_params)
            redirect_to games_path
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        authorize @game
        @game.destroy
        redirect_to games_path(@game)
    end

    private
    def set_game
        @game = Game.find(params[:id])
    end

    def game_params
        params.require(:game).permit(:team_1_id , :team_2_id, :team_1_score, :team_2_score, :tournament_id)
    end
end
