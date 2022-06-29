class PlayersController < ApplicationController
    before_action :set_player, only: %i[show edit update destroy]
    before_action :set_team

    def new  
        @player = @team.players.new()
    end

    def create
        @player = @team.players.new(player_params)
        authorize @player
        if @player.save
            redirect_to @team
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        authorize @player
        if @player.update(player_params)
            redirect_to @team
        else
            render :edit , status: :unprocessable_entity
        end
    end
  
    def destroy 
        authorize @player
        @player.destroy
        redirect_to @team
    end

    private
    def set_team 
        @team = Team.find(params[:team_id])
    end

    def set_player 
        @player = Player.find(params[:id])
    end

    def player_params
        params.require(:player).permit(:first_name, :last_name, :age)
    end
end
