class GameController < ApplicationController
  include GameHelper

  before_action :set_game_state, only: [:battle, :processturn]

  def create
    @game_state = Gamestate.new
    sanitize!(@game_state)
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

  #shuffle takes a seed for rng
  def deal_starting_hand(state)
    deck_arr = str_to_arr(state.my_deck).shuffle!(random: Random.new(1))
    5.times do |card|
      state.hand += " " + deck_arr.shift.to_s
    end
    state.my_deck = arr_to_str(deck_arr)
  end

  def set_game_state
    @game_state = Gamestate.find(params[:id])
  end

  # def game_state_params
  #   params.require(:gameState).permit()
  # end
end
