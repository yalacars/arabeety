class TiersController < ApplicationController
  before_action :set_tier, only: [:show, :edit, :update, :destroy]

  # GET /tiers
  # GET /tiers.json
  def index
    @tiers = Tier.all
  end

  # GET /tiers/1
  # GET /tiers/1.json
  def show
  end

  # GET /tiers/new
  def new
    @tier = Tier.new
  end

  # GET /tiers/1/edit
  def edit
  end

  # POST /tiers
  # POST /tiers.json
  def create
    @tier = Tier.new(tier_params)
    @tier.id = Tier.last.id + 1 
    respond_to do |format|
      if @tier.save
        format.html { redirect_to tiers_url, notice: 'Tier was successfully created.' }
        format.json { render :show, status: :created, location: @tier }
      else
        format.html { render :new }
        format.json { render json: @tier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tiers/1
  # PATCH/PUT /tiers/1.json
  def update
    respond_to do |format|
      if @tier.update(tier_params)
        format.html { redirect_to tiers_url, notice: 'Tier was successfully updated.' }
        format.json { render :show, status: :ok, location: @tier }
      else
        format.html { render :edit }
        format.json { render json: @tier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tiers/1
  # DELETE /tiers/1.json
  def destroy
    @tier.destroy
    respond_to do |format|
      format.html { redirect_to tiers_url, notice: 'Tier was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tier
      @tier = Tier.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tier_params




      params.require(:tier).permit(:engine_damaged, :engine_repaired, :engine_changed, :tier_name, :total_kilometer_percentage, :one_kilometer, :two_kilometer, :three_kilometer, :four_kilometer, :five_kilometer, :six_kilometer, :seven_kilometer, :eight_kilometer, :nine_kilometer, :ten_kilometer, :eleven_kilometer, :twelve_kilometer, :thirteen_kilometer, :fourteen_kilometer, :fifthteen_kilometer, :sixthteen_kilometer, :total_year_percentage, :one_year, :two_year, :three_year, :four_year, :five_year, :six_year, :seven_year, :eight_year, :nine_year, :ten_year, :total_condition_percentage, :ac_percentage, :brakes_percentage, :electrical_percentage, :rims_percentage, :seats_percentage, :radio_percentage, :steering_percentage, :suspension_percentage, :transmission_percentage, :tyres_percentage, :chasis_percentage, :ac_bad_percentage, :ac_good_percentage, :ac_verygood_percentage, :brakes_bad_percentage, :brakes_good_percentage, :brakes_verygood_percentage, :electrical_bad_percentage, :electrical_good_percentage, :electrical_verygood_percentage, :rims_bad_percentage, :rims_good_percentage, :rims_verygood_percentage, :seats_bad_percentage, :seats_good_percentage, :seats_verygood_percentage, :radio_bad_percentage, :radio_good_percentage, :radio_verygood_percentage, :steering_bad_percentage, :steering_good_percentage, :steering_verygood_percentage, :transmission_bad_percentage, :transmission_good_percentage, :transmission_verygood_percentage, :tyres_bad_percentage, :tyres_good_percentage, :tyres_verygood_percentage, :chasis_bad_percentage, :chasis_good_percentage, :chasis_verygood_percentage, :suspension_bad_percentage, :suspension_good_percentage, :suspension_verygood_percentage,  :roof_damaged, :roof_damaged_repaired, :roof_damaged_changed, :front_middle_bumper_damaged, :front_middle_bumper_repaired, :front_middle_bumper_changed, :left_front_bumper_damaged, :left_front_bumper_repaired, :left_front_bumper_changed, :right_front_bumper_damaged, :right_front_bumper_repaired, :right_front_bumper_changed, :right_front_door_damaged, :right_front_door_repaired, :right_front_door_changed, :right_back_door_damaged, :right_back_door_repaired, :right_back_door_changed, :left_front_door_damaged, :left_front_door_repaired, :left_front_door_changed, :left_back_door_damaged, :left_back_door_repaired, :left_back_door_changed, :middle_back_bumper_damaged, :middle_back_bumper_repaired, :middle_back_bumper_changed, :left_back_bumper_damaged, :left_back_bumper_repaired, :left_back_bumper_changed, :right_back_bumper_damaged, :right_back_bumper_repaired, :right_back_bumper_changed, :roof_painted, :front_middle_bumper_painted, :left_front_bumper_painted, :right_front_bumper_painted, :right_front_door_painted, :right_back_door_painted, :left_front_door_painted, :left_back_door_painted, :middle_back_bumper_painted, :left_back_bumper_painted, :right_back_bumper_painted, :engine_bad, :engine_good, :engine_verygood)
    end
end
