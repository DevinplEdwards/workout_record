class ExcercisesController < ApplicationController
  before_action :set_excercise, only: %i[ show edit update destroy ]

  # GET /excercises or /excercises.json
  def index
    @excercises = Excercise.all
  end

  # GET /excercises/1 or /excercises/1.json
  def show
  end

  # GET /excercises/new
  def new
    @excercise = Excercise.new
  end

  # GET /excercises/1/edit
  def edit
  end

  # POST /excercises or /excercises.json
  def create
    @excercise = Excercise.new(excercise_params)

    respond_to do |format|
      if @excercise.save
        format.html { redirect_to excercise_url(@excercise), notice: "Excercise was successfully created." }
        format.json { render :show, status: :created, location: @excercise }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @excercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /excercises/1 or /excercises/1.json
  def update
    respond_to do |format|
      if @excercise.update(excercise_params)
        format.html { redirect_to excercise_url(@excercise), notice: "Excercise was successfully updated." }
        format.json { render :show, status: :ok, location: @excercise }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @excercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /excercises/1 or /excercises/1.json
  def destroy
    @excercise.destroy

    respond_to do |format|
      format.html { redirect_to excercises_url, notice: "Excercise was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_excercise
      @excercise = Excercise.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def excercise_params
      params.require(:excercise).permit(:type)
    end
end
