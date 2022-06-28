class GamesController < ApplicationController
    before_action :set_game, only: %i[show edit update destroy]

    def index
        @games = Game.all
    end

    def new
        @game = Game.new(team_1_id: params[:team_id])
    end

    def create
        @game = Game.new(game_params)

        if @game.save
            redirect_to games_path
       else 
            render :new, status: :unprocessable_entity
       end
    end

    def edit
        
    end

    def update
        @team = params[:team_id]
        if @game.update(game_params)
            redirect_to @game.team_1
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @game.destroy
        redirect_to games_path(@game)
    end

    private
    def set_game
        @game = Game.find(params[:id])
    end

    def game_params
        params.require(:game).permit(:team_1_id , :team_2_id, :team_1_score, :team_2_score)
    end
end
