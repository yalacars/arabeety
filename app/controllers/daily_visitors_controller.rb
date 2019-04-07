class DailyVisitorsController < ApplicationController
  before_action :set_daily_visitor, only: [:show, :edit, :update, :destroy]

  # GET /daily_visitors
  # GET /daily_visitors.json
  def index
    @daily_visitors = DailyVisitor.all
  end

  # GET /daily_visitors/1
  # GET /daily_visitors/1.json
  def show
  end

  # GET /daily_visitors/new
  def new
    @daily_visitor = DailyVisitor.new
  end

  # GET /daily_visitors/1/edit
  def edit
  end

  # POST /daily_visitors
  # POST /daily_visitors.json
  def create
    @daily_visitor = DailyVisitor.new(daily_visitor_params)

    respond_to do |format|
      if @daily_visitor.save
        format.html { redirect_to @daily_visitor, notice: 'Daily visitor was successfully created.' }
        format.json { render :show, status: :created, location: @daily_visitor }
      else
        format.html { render :new }
        format.json { render json: @daily_visitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /daily_visitors/1
  # PATCH/PUT /daily_visitors/1.json
  def update
    respond_to do |format|
      if @daily_visitor.update(daily_visitor_params)
        format.html { redirect_to @daily_visitor, notice: 'Daily visitor was successfully updated.' }
        format.json { render :show, status: :ok, location: @daily_visitor }
      else
        format.html { render :edit }
        format.json { render json: @daily_visitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daily_visitors/1
  # DELETE /daily_visitors/1.json
  def destroy
    @daily_visitor.destroy
    respond_to do |format|
      format.html { redirect_to daily_visitors_url, notice: 'Daily visitor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daily_visitor
      @daily_visitor = DailyVisitor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def daily_visitor_params
      params.require(:daily_visitor).permit(:user_email)
    end
end
