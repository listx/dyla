class GameController < ApplicationController


  def create
    @game_state = Gamestate.new

    @game_state.save
    redirect_to action: 'battle', id: @game_state.id
  end

  def processturn
    @game_state.turns += 1
    @game_state.save
    redirect_to action: 'battle', id: @game_state.id
  end

  def battle

  end

  def rules

  end

  private






  def set_game_state
    @game_state = Gamestate.find(params[:id])
  end
end
