class EnemycardsController < ApplicationController
  before_action :set_enemycard, only: [:show, :edit, :update, :destroy]

  # GET /enemycards
  # GET /enemycards.json
  def index
    @enemycards = Enemycard.all
  end

  # GET /enemycards/1
  # GET /enemycards/1.json
  def show
  end

  # GET /enemycards/new
  def new
    @enemycard = Enemycard.new
  end

  # GET /enemycards/1/edit
  def edit
  end

  # POST /enemycards
  # POST /enemycards.json
  def create
    @enemycard = Enemycard.new(enemycard_params)

    respond_to do |format|
      if @enemycard.save
        format.html { redirect_to @enemycard, notice: 'Enemycard was successfully created.' }
        format.json { render :show, status: :created, location: @enemycard }
      else
        format.html { render :new }
        format.json { render json: @enemycard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enemycards/1
  # PATCH/PUT /enemycards/1.json
  def update
    respond_to do |format|
      if @enemycard.update(enemycard_params)
        format.html { redirect_to @enemycard, notice: 'Enemycard was successfully updated.' }
        format.json { render :show, status: :ok, location: @enemycard }
      else
        format.html { render :edit }
        format.json { render json: @enemycard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enemycards/1
  # DELETE /enemycards/1.json
  def destroy
    @enemycard.destroy
    respond_to do |format|
      format.html { redirect_to enemycards_url, notice: 'Enemycard was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enemycard
      @enemycard = Enemycard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enemycard_params
      params.require(:enemycard).permit(:name, :damage, :hp, :vp, :tp, :description)
    end
end
