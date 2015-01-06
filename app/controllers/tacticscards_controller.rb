class TacticscardsController < ApplicationController
  before_action :set_tacticscard, only: [:show, :edit, :update, :destroy]

  # GET /tacticscards
  # GET /tacticscards.json
  def index
    @tacticscards = Tacticscard.all
  end

  # GET /tacticscards/1
  # GET /tacticscards/1.json
  def show
  end

  # GET /tacticscards/new
  def new
    @tacticscard = Tacticscard.new
  end

  # GET /tacticscards/1/edit
  def edit
  end

  # POST /tacticscards
  # POST /tacticscards.json
  def create
    @tacticscard = Tacticscard.new(tacticscard_params)

    respond_to do |format|
      if @tacticscard.save
        format.html { redirect_to @tacticscard, notice: 'Tacticscard was successfully created.' }
        format.json { render :show, status: :created, location: @tacticscard }
      else
        format.html { render :new }
        format.json { render json: @tacticscard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tacticscards/1
  # PATCH/PUT /tacticscards/1.json
  def update
    respond_to do |format|
      if @tacticscard.update(tacticscard_params)
        format.html { redirect_to @tacticscard, notice: 'Tacticscard was successfully updated.' }
        format.json { render :show, status: :ok, location: @tacticscard }
      else
        format.html { render :edit }
        format.json { render json: @tacticscard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tacticscards/1
  # DELETE /tacticscards/1.json
  def destroy
    @tacticscard.destroy
    respond_to do |format|
      format.html { redirect_to tacticscards_url, notice: 'Tacticscard was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tacticscard
      @tacticscard = Tacticscard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tacticscard_params
      params.require(:tacticscard).permit(:name, :cost, :description)
    end
end
