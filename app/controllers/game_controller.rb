class GameController < ApplicationController
  include GameHelper

  before_action :set_game_state, only: [:create, :battle]

  def create
    redirect_to battle_path
  end

  def battle

  end

  def rules

  end

  private

  def sanitize!(state)
    state.victory_points = 0
    state.tech_points = 0
    state.hit_points = 10
    state.enemy_deck = 1
    state.hand = ""
    state.my_deck = "1 1 1 2 2 2 2 2 2 2"
    state.discard = ""
    state.turn_phase = 0
    state.turns = 0

    deal_starting_hand(state)
  end

  def deal_starting_hand(state)
    deck_arr = str_to_arr(state.my_deck).shuffle!
    5.times do |card|
      state.hand += " " + deck_arr.shift.to_s
    end
    state.my_deck = arr_to_str(deck_arr)
  end

  def set_game_state
    @new_state ||= Gamestate.new
    sanitize!(@new_state)
  end

  # def game_state_params
  #   params.require(:gameState).permit()
  # end
end
