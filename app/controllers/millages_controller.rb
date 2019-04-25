class MillagesController < ApplicationController
  before_action :set_millage, only: [:show, :edit, :update, :destroy]

  # GET /millages
  # GET /millages.json
  def index
    @millages = Millage.all
  end

  # GET /millages/1
  # GET /millages/1.json
  def show
  end

  # GET /millages/new
  def new
    @millage = Millage.new
  end

  # GET /millages/1/edit
  def edit
  end

  # POST /millages
  # POST /millages.json
  def create
    @millage = Millage.new(millage_params)
    @millage.id = Millage.last.id + 1 
    respond_to do |format|
      if @millage.save
        format.html { redirect_to millages_url}
        format.json { render :show, status: :created, location: @millage }
      else
        format.html { render :new }
        format.json { render json: @millage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /millages/1
  # PATCH/PUT /millages/1.json
  def update
    respond_to do |format|
      if @millage.update(millage_params)
        format.html { redirect_to millages_url}
        format.json { render :show, status: :ok, location: @millage }
      else
        format.html { render :edit }
        format.json { render json: @millage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /millages/1
  # DELETE /millages/1.json
  def destroy
    @millage.destroy
    respond_to do |format|
      format.html { redirect_to millages_url}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_millage
      @millage = Millage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def millage_params
      params.require(:millage).permit(:range)
    end
end
