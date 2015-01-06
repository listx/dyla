class GameController < ApplicationController
  def create
    @new_state = Gamestate.new
    @new_state = sanitize(@new_state)
  end


  private

  def sanitize(state)
    state.victory_points = 0
    state.tech_points = 0
    state.hit_points = 10
    state.enemy_deck = 1
    state.hand = []
    state.my_deck = [1, 1, 1, 2, 2, 2, 2, 2, 2, 2]
    state.discard = []
    state.turn_phase = 0
  end

  # def game_state_params
  #   params.require(:gameState).permit()
  # end
end
