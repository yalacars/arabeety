class TrimsController < ApplicationController
  before_action :set_trim, only: [:show, :edit, :update, :destroy]

  # GET /trims
  # GET /trims.json
  def index
    @trims = Trim.all
  end

  # GET /trims/1
  # GET /trims/1.json
  def show
  end

  # GET /trims/new
  def new
    @trim = Trim.new
  end

  # GET /trims/1/edit
  def edit
  end

  # POST /trims
  # POST /trims.json
  def create
    @trim = Trim.new(trim_params)

    respond_to do |format|
      if @trim.save
        format.html { redirect_to trims_url}
        format.json { render :show, status: :created, location: @trim }
      else
        format.html { render :new }
        format.json { render json: @trim.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trims/1
  # PATCH/PUT /trims/1.json
  def update
    respond_to do |format|
      if @trim.update(trim_params)
        format.html { redirect_to trims_url}
        format.json { render :show, status: :ok, location: @trim }
      else
        format.html { render :edit }
        format.json { render json: @trim.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trims/1
  # DELETE /trims/1.json
  def destroy
    @trim.destroy
    respond_to do |format|
      format.html { redirect_to trims_url}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trim
      @trim = Trim.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trim_params
      params.require(:trim).permit(:trim)
    end
end
