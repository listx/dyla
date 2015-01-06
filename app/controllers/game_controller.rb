class GameController < ApplicationController
  def create
    @new_state = Gamestate.new
    @new_state = sanitize(@new_state)
    redirect_to battle_path
  end

  def battle

  end

  def rules

  end

  private

  def sanitize(state)
    state.victory_points = 0
    state.tech_points = 0
    state.hit_points = 10
    state.enemy_deck = 1
    state.hand = ""
    state.my_deck = "1 1 1 2 2 2 2 2 2 2"
    state.discard = ""
    state.turn_phase = 0

    state.my_deck = str_to_arr(state.my_deck)
    deal_starting_hand(state)
  end

  # takes "1 2 3 4" turns into [1,2,3,4]
  def str_to_arr(string)
    arr_of_strings = string.split(" ")
    arr_of_strings.map! do |element|
      element.to_i
    end
  end

  def deal_starting_hand(state)
    deck_arr = str_to_arr(state.my_deck)
    5.times do |card|
      state.hand << deck_arr.shift
    end
  end

  # def game_state_params
  #   params.require(:gameState).permit()
  # end
end
