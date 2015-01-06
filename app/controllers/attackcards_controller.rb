class AttackcardsController < ApplicationController
  before_action :set_attackcard, only: [:show, :edit, :update, :destroy]

  # GET /attackcards
  # GET /attackcards.json
  def index
    @attackcards = Attackcard.all
  end

  # GET /attackcards/1
  # GET /attackcards/1.json
  def show
  end

  # GET /attackcards/new
  def new
    @attackcard = Attackcard.new
  end

  # GET /attackcards/1/edit
  def edit
  end

  # POST /attackcards
  # POST /attackcards.json
  def create
    @attackcard = Attackcard.new(attackcard_params)

    respond_to do |format|
      if @attackcard.save
        format.html { redirect_to @attackcard, notice: 'Attackcard was successfully created.' }
        format.json { render :show, status: :created, location: @attackcard }
      else
        format.html { render :new }
        format.json { render json: @attackcard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attackcards/1
  # PATCH/PUT /attackcards/1.json
  def update
    respond_to do |format|
      if @attackcard.update(attackcard_params)
        format.html { redirect_to @attackcard, notice: 'Attackcard was successfully updated.' }
        format.json { render :show, status: :ok, location: @attackcard }
      else
        format.html { render :edit }
        format.json { render json: @attackcard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attackcards/1
  # DELETE /attackcards/1.json
  def destroy
    @attackcard.destroy
    respond_to do |format|
      format.html { redirect_to attackcards_url, notice: 'Attackcard was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attackcard
      @attackcard = Attackcard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attackcard_params
      params.require(:attackcard).permit(:name, :cost, :damage, :description)
    end
end
