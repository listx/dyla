class GamestatesController < ApplicationController
  include GameHelper
  before_action :set_gamestate, only: [:show, :edit, :update, :destroy]

  # GET /gamestates
  # GET /gamestates.json
  def index
    @gamestates = Gamestate.all
  end

  # GET /gamestates/1
  # GET /gamestates/1.json
  def show
  end

  # GET /gamestates/new
  def new
    @gamestate = Gamestate.new
  end

  # GET /gamestates/1/edit
  def edit
  end

  # POST /gamestates
  # POST /gamestates.json
  def create
    @gamestate = Gamestate.new(gamestate_params)
    sanitize!(@gamestate)

    respond_to do |format|
      if @gamestate.save
        format.html { redirect_to @gamestate, notice: 'Gamestate was successfully created.' }
        format.json { render :show, status: :created, location: @gamestate }
      else
        format.html { render :new }
        format.json { render json: @gamestate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gamestates/1
  # PATCH/PUT /gamestates/1.json
  def update
    respond_to do |format|
      if @gamestate.update(gamestate_params)
        @gamestate.turns += 1
        @gamestate.save
        format.html { redirect_to @gamestate, notice: 'Gamestate was successfully updated.' }
        format.json { render :show, status: :ok, location: @gamestate }
      else
        format.html { render :edit }
        format.json { render json: @gamestate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gamestates/1
  # DELETE /gamestates/1.json
  def destroy
    @gamestate.destroy
    respond_to do |format|
      format.html { redirect_to gamestates_url, notice: 'Gamestate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gamestate
      @gamestate = Gamestate.find(params[:id])
    end

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

    # Never trust parameters from the scary internet, only allow the white list through.
    def gamestate_params
      params.require(:gamestate).permit(:victory_points,:tech_points, :hit_points, :enemy_deck, :hand, :my_deck, :discard, :turn_phase, :turns)
    end
end
