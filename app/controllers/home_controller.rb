class HomeController < ApplicationController


	def index 

		@users = User.all
		@valuations = Valuation.all
		@partners = Partner.all

	end

	def administrator


	end

def add_order_to_model

@car_model = CarModel.find(params[:car_model])
@car_model.order_c = params[:order_c]
@car_model.save

redirect_to brands_url

end




		def update_pass

			  @user = User.find_by_password_reset_token!(params[:token])
		  if @user.password_reset_sent_at < 2.hours.ago
		    redirect_to root_url, :alert => "Password reset has expired."
		  else
		   @user.update(user_params)
		    redirect_to root_url, :notice => "Your password has been reset!"
		  end

		end


def getKM

		@array = []
		for brand in Millage.all

			@array.push(:id => brand.id.to_s, :name => brand.range)

		end
		render :json => @array


end


def getYears


@array = []
		for brand in Year.all.reverse

			@array.push(:id => brand.id.to_s, :name => brand.date)

		end
		render :json => @array


end


def getBrands

@array = []
		for brand in Brand.all

			@array.push(:id => brand.id.to_s, :name => brand.name)

		end
		render :json => @array

end


	def getModels



		@models = CarModel.where("brand =?",params[:brand_id])

		@model_years = []


		@years = Year.all

		#Year.where('date >= ? AND date <= ?', params[:years], params[:years_end])

				for model in @models
					if model.years

						if model.years_end

            


							if Year.find(model.years).date <= Year.find(params[:years]).date and Year.find(params[:years]).date <= Year.find(model.years_end).date   
				
								@model_years.push(model)
							end


						else

								if Year.find(model.years).date >= Year.find(params[:years]).date 
				
								@model_years.push(model)
							end


						end


					end
				end






		@array = []
		for model in @model_years

			@array.push(:id => model.id.to_s, :name => model.name)

		end
		render :json => @array



	end

	def delete_admin

		@admin = Admin.find(params[:admin])

		@admin.destroy
		redirect_to admins_url
	end



	def delete_user

		@user = User.find(params[:user_id])
		@valuations = Valuation.where("user_id =?",@user.id)
		@messages = Message.where("user_id =?",@user.id)
		@user_stat = UserStat.new

		@user_stat.state = "Deleted"
		@user_stat.email = @user.email
		@user_stat.save

		@valuations.delete_all
		@messages.delete_all
		@user.destroy




		redirect_to users_url

	end


	def delete_tier

		@tier = Tier.find(params[:tier])
		@car_models = CarModel.where("tier =?",@tier.id)
		@car_models.delete_all
		@tier.destroy


		redirect_to tiers_url


	end


	def delete_year

		@year = Year.find(params[:year])
		Valuation.where("year_car =?",@year.id).delete_all
		CarModel.where("years =?",@year.id).delete_all
		CarModel.where("years_end =?",@year.id).delete_all
		@year.destroy
		redirect_to years_url
		
	end

	def delete_owner

		@owner = Owner.find(params[:owner])

		Valuation.where("number_owners =?",@owner.id).delete_all
		@owner.destroy
		redirect_to owners_url
		
	end

	def delete_brand

		@brand = Brand.find(params[:brand])



		CarModel.where("brand =?",@brand.name).delete_all
		Valuation.where("brand =?",@brand.id).delete_all


		@brand.destroy
		redirect_to brands_url
		
	end



	def delete_car_model

		@carmodel = CarModel.find(params[:car_model])
		Valuation.where("model_car =?",@carmodel.id).delete_all
		@carmodel.destroy
		redirect_to brands_url

	end

	def delete_trim

		@trim = Trim.find(params[:trim])
		Valuation.where("trim_select =?",@trim.id).delete_all
		@trim.destroy
		redirect_to brands_url

	end

	def delete_millage

		@millage = Millage.find(params[:millage])
		Valuation.where("kilometers =?",@millage.id).delete_all
		@millage.destroy
		redirect_to millages_url
	end



	def register_valuation

		@valuation = Valuation.new(valuation_params)
		@user = User.find(params[:valuation][:user_id])
    respond_to do |format|
      if @valuation.save
        @valuation.save
      	 @model = CarModel.find(@valuation.model_car)
        @tier = Tier.find(@model.tier)

        @condition_string = "Avarage"
        @price = @model.price.gsub(",", "")
        @price_model =  @price.to_i
        logger.info("REMOVED , : " + @price_model.to_s)
        @deducted_second = 0
        @deducted_third = 0
        @deducted_fourth = 0
        @year_percentage = 0
        @km_percentage = 0
        @ac_percentage = 0
        @brakes_percentage = 0
        @electrical_percentage = 0
        @rims_percentage = 0
        @seats_percentage = 0
        @radio_percentage = 0
        @steering_perentage = 0
        @suspension_percentage = 0
        @transmission_percentage = 0
        @tyres_percentage = 0
        @chasis_percentage = 0

        if Year.find(@valuation.year_car).date == "2010"

          @year_percentage = @tier.one_year

        elsif Year.find(@valuation.year_car).date == "2011"

          @year_percentage = @tier.two_year

        elsif Year.find(@valuation.year_car).date == "2012"
        
          @year_percentage = @tier.three_year

        elsif Year.find(@valuation.year_car).date == "2013"

          @year_percentage = @tier.four_year

        elsif Year.find(@valuation.year_car).date == "2014"

          @year_percentage = @tier.five_year

        elsif Year.find(@valuation.year_car).date == "2015"  

          @year_percentage = @tier.six_year

        elsif Year.find(@valuation.year_car).date == "2016"

          @year_percentage = @tier.seven_year
        
        elsif Year.find(@valuation.year_car).date == "2017"

          @year_percentage = @tier.eight_year


        elsif Year.find(@valuation.year_car).date == "2018"

          @year_percentage = @tier.nine_year


        elsif Year.find(@valuation.year_car).date == "2019"

          @year_percentage = @tier.ten_year

        end
            

        logger.info("Checking  KM - " + Millage.find(@valuation.kilometers).range.to_s)

        if Millage.find(@valuation.kilometers.to_i).range.to_s == "0-999"

          @km_percentage = @tier.one_kilometer
          logger.info("Assigning KM " + @km_percentage.to_s)
        
        end


        if Millage.find(@valuation.kilometers.to_i).range.to_s == "1,000-4,999"

          @km_percentage = @tier.two_kilometer    
          logger.info("Assigning KM " + @km_percentage.to_s)
       

        end


        if Millage.find(@valuation.kilometers.to_i).range.to_s == "5,000-9,999"

          @km_percentage = @tier.three_kilometer
          logger.info("Assigning KM " + @km_percentage.to_s)
       
         end 



        if Millage.find(@valuation.kilometers.to_i).range.to_s == "10,000-19,999"

          @km_percentage = @tier.four_kilometer
          logger.info("Assigning KM " + @km_percentage.to_s)
        
        end



        if Millage.find(@valuation.kilometers.to_i).range.to_s == "20,000-29,999"

          @km_percentage = @tier.five_kilometer
          logger.info("Assigning KM " + @km_percentage.to_s)

        end




        if Millage.find(@valuation.kilometers.to_i).range.to_s == "30,000-39,999"

          @km_percentage = @tier.six_kilometer
          logger.info("Assigning KM " + @km_percentage.to_s)
        
        end




        if Millage.find(@valuation.kilometers.to_i).range.to_s == "40,000-49,999"


          @km_percentage = @tier.seven_kilometer
          logger.info("Assigning KM " + @km_percentage.to_s)
        
        end




       if Millage.find(@valuation.kilometers.to_i).range.to_s == "50,000-59,999"


          @km_percentage = @tier.eight_kilometer
          logger.info("Assigning KM " + @km_percentage.to_s)
        
        end  




        if Millage.find(@valuation.kilometers.to_i).range.to_s == "60,000-79,999"


          @km_percentage = @tier.nine_kilometer
          logger.info("Assigning KM " + @km_percentage.to_s)
        
        end




        if Millage.find(@valuation.kilometers.to_i).range.to_s == "80,000-99,999"


          @km_percentage = @tier.ten_kilometer
          logger.info("Assigning KM " + @km_percentage.to_s)
        
        end



        if Millage.find(@valuation.kilometers.to_i).range.to_s == "100,000-119,999"


          @km_percentage = @tier.eleven_kilometer
          logger.info("Assigning KM " + @km_percentage.to_s)
        
        end



        if Millage.find(@valuation.kilometers.to_i).range.to_s == "120,000-139,999"


          @km_percentage = @tier.twelve_kilometer
          logger.info("Assigning KM " + @km_percentage.to_s)
        

        end




         if Millage.find(@valuation.kilometers.to_i).range.to_s == "140,000-159,999"


          @km_percentage = @tier.thirteen_kilometer
          logger.info("Assigning KM " + @km_percentage.to_s)
        
        end



        if Millage.find(@valuation.kilometers.to_i).range.to_s == "160,000-179,999"

          @km_percentage = @tier.fourteen_kilometer
          logger.info("Assigning KM " + @km_percentage.to_s)
        
        end
        


        if Millage.find(@valuation.kilometers.to_i).range.to_s == "180,000-199,999"


          @km_percentage = @tier.fifthteen_kilometer
          logger.info("Assigning KM " + @km_percentage.to_s)
        end


        if Millage.find(@valuation.kilometers.to_i).range.to_s == "200,000+"
          
          @km_percentage = @tier.sixthteen_kilometer
          logger.info("Assigning KM " + @km_percentage.to_s)


        end


#AC
            logger.info("AC - " + @valuation.ac.to_s)
            logger.info("brakes - " + @valuation.brakes.to_s)
            logger.info("rims - " + @valuation.rims.to_s)
            logger.info("seats - " + @valuation.seats.to_s)
            logger.info("radio - " + @valuation.radio.to_s)
            logger.info("transmission - " + @valuation.transmission.to_s)
            logger.info("tyres - " + @valuation.tyres.to_s)
            logger.info("AC - " + @valuation.ac.to_s)
            logger.info("AC - " + @valuation.ac.to_s)
        

        if @valuation.ac == "bad"

          @ac_percentage = @tier.ac_bad_percentage
 @condition_string = "bad"
        elsif @valuation.ac == "good"
          @condition_string = "average"
          @ac_percentage = @tier.ac_good_percentage    
        else

          @ac_percentage = @tier.ac_verygood_percentage    
          @condition_string = "excellent"
        end

        logger.info("AC  % - " + @ac_percentage.to_s)

#Brakes



       if @valuation.brakes == "bad"
 @condition_string = "bad"
          @brakes_percentage = @tier.brakes_bad_percentage

        elsif @valuation.brakes == "good"
 @condition_string = "average"
          @brakes_percentage = @tier.brakes_good_percentage    
        
        else

          @brakes_percentage = @tier.brakes_verygood_percentage    
          @condition_string = "excellent"
        end

        logger.info("BRAKES  % - " + @brakes_percentage.to_s)
#Rims



      if @valuation.rims == "bad"
 @condition_string = "bad"
          @rims_percentage = @tier.rims_bad_percentage

        elsif @valuation.rims == "good"
 @condition_string = "average"
          @rims_percentage = @tier.rims_good_percentage    
        
        else

          @rims_percentage = @tier.rims_verygood_percentage    
          @condition_string = "excellent"
        end

      logger.info("RIMS  % - " + @rims_percentage.to_s)



#Suspension



      if @valuation.suspension == "bad"

          @suspension_percentage = @tier.suspension_bad_percentage
 @condition_string = "bad"
        elsif @valuation.suspension == "good"
 @condition_string = "average"
          @suspension_percentage = @tier.suspension_good_percentage    
        
        else
          @condition_string = "excellent"
          @suspension_percentage = @tier.suspension_verygood_percentage    

        end

      logger.info("SUSPENSION  % - " + @suspension_percentage.to_s)



#Seats



      if @valuation.seats == "bad"
 @condition_string = "bad"
          @rseats_percentage = @tier.seats_bad_percentage

        elsif @valuation.seats == "good"
 @condition_string = "average"
          @seats_percentage = @tier.seats_good_percentage    
        
        else
@condition_string = "excellent"
          @seats_percentage = @tier.seats_verygood_percentage    

        end
   logger.info("SEATS  % - " + @seats_percentage.to_s)


#Radio



      if @valuation.radio == "bad"
 @condition_string = "bad"
          @radio_percentage = @tier.radio_bad_percentage

        elsif @valuation.radio == "good"
 @condition_string = "average"
          @radio_percentage = @tier.radio_good_percentage    
        
        else
          @condition_string = "excellent"
          @radio_percentage = @tier.radio_verygood_percentage    

        end


   logger.info("RADIO  % - " + @radio_percentage.to_s)


#Transmission



      if @valuation.transmission == "bad"
 @condition_string = "bad"
          @transmission_percentage = @tier.transmission_bad_percentage

        elsif @valuation.transmission == "good"
 @condition_string = "average"
          @transmission_percentage = @tier.transmission_good_percentage    
        
        else
          @condition_string = "excellent"
          @transmission_percentage = @tier.transmission_verygood_percentage    

        end

   logger.info("TRANSMISSION  % - " + @transmission_percentage.to_s)

#Tyres



      if @valuation.tyres == "bad"

          @tyres_percentage = @tier.tyres_bad_percentage
 @condition_string = "bad"
        elsif @valuation.tyres == "good"
 @condition_string = "average"
          @tyres_percentage = @tier.tyres_good_percentage    
        
        else
          @condition_string = "excellent"
          @tyres_percentage = @tier.tyres_verygood_percentage    

        end

logger.info("TYRES  % - " + @tyres_percentage.to_s)





### First Deduction


      @discount_percentages = @tyres_percentage.to_f + @transmission_percentage.to_f + @suspension_percentage + @radio_percentage.to_f + @seats_percentage.to_f + @rims_percentage.to_f +  @brakes_percentage.to_f + @year_percentage.to_f +  @km_percentage.to_f + @ac_percentage.to_f
        
        logger.info("KM % - " + @km_percentage.to_s)
        logger.info("Year % - " + @year_percentage.to_s)
        
 
  logger.info("TOTAL SUM  % - " + @discount_percentages.to_s)

      @first_percentage = 100 - @discount_percentages
logger.info("Original PRICE - " + @price_model.to_s)
      logger.info("FIRST % - " + @first_percentage.to_s)

    
      @first_final_price = (@price_model * @first_percentage)/100

     # @first_final_price = @price_model - @first_final_price
      logger.info("FIRST PRICE - " + @first_final_price.to_s)

      if @valuation.car_paint == "yes"

        logger.info("CALCULATING PAINT DISCOUNT")
        @condition_string = "average"
        @roof_percentage = 0
        @left_front_bumper_percentage = 0
        @right_front_bumper_percentage = 0
        @middle_front_bumper_percentage = 0
        @right_side_front_door_percentage = 0
        @right_side_back_door_percentage = 0
        @left_side_front_door_percentage = 0
        @left_side_back_door_percentage = 0
        @middle_back_bumper_percentage = 0
        @left_back_bumper_percentage = 0
        @right_back_bumper_percentage = 0


        if @valuation.paint_second_top

           @roof_percentage = @tier.roof_painted

        end


        if @valuation.paint_lights_hood

           @middle_front_bumper_percentage = @tier.front_middle_bumper_painted

        end



        if @valuation.paint_lights_left_front

           @left_front_bumper_percentage = @tier.left_front_bumper_painted

        end



        if @valuation.paint_lights_right_front

           @right_front_bumper_percentage = @tier.right_front_bumper_painted

        end



        if @valuation.paint_second_side

           @right_side_front_door_percentage = @tier.right_front_door_painted

        end


        if @valuation.paint_third_side

           @right_side_back_door_percentage = @tier.right_back_door_painted

        end



        if @valuation.paint_second_left_side

           @left_side_front_door_percentage = @tier.left_front_door_painted

        end


        if @valuation.paint_third_left_side

           @left_side_back_door_percentage = @tier.left_back_door_painted

        end

        if @valuation.paint_middle_back

           @middle_back_bumper_percentage = @tier.middle_back_bumper_painted

        end


        if @valuation.paint_left_back

           @left_back_bumper_percentage = @tier.left_back_bumper_painted

        end


        if @valuation.paint_right_back

           @right_back_bumper_percentage = @tier.right_back_bumper_painted

        end

        @discount_percentages_second = @roof_percentage  +  @left_front_bumper_percentage +  @right_front_bumper_percentage +  @middle_front_bumper_percentage + @right_side_front_door_percentage + @right_side_back_door_percentage + @left_side_front_door_percentage + @left_side_back_door_percentage + @middle_back_bumper_percentage + @left_back_bumper_percentage + @right_back_bumper_percentage


        logger.info("ROOF Paint % - " + @roof_percentage.to_s)
        logger.info("LEFT FRONT BUMPER Paint % - " + @left_front_bumper_percentage.to_s)
        logger.info("RIGHT FRONT BUMPER Paint % - " + @right_front_bumper_percentage.to_s)
        logger.info("MIDDLE FRONT BUMPER Paint % - " + @middle_front_bumper_percentage.to_s)

        logger.info("RIGHT SIDE FRONT DOOR Paint % - " + @right_side_front_door_percentage.to_s)
        logger.info("RIGHT SIDE BACK DOOR Paint % - " + @right_side_back_door_percentage.to_s)
        logger.info("LEFT SIDE FRONT DOOR Paint % - " + @left_side_front_door_percentage.to_s)
        logger.info("LEFT SIDE BACK DOOR Paint % - " + @left_side_back_door_percentage.to_s)


        logger.info("MIDDLE BACK BUMPER Paint % - " + @middle_back_bumper_percentage.to_s)
        logger.info("LEFT BACK BUMPER Paint % - " + @left_back_bumper_percentage.to_s)
        logger.info("RIGHT BACK BUMPER Paint % - " + @right_back_bumper_percentage.to_s)

        logger.info("SUM  Paint % - " + @discount_percentages_second.to_s)


       # @deducted_second =  (@discount_percentages_second * @first_final_price) / 100

        @deducted_second = @discount_percentages_second
         logger.info("Discount  Paint EGP - " + @deducted_second.to_s)



       # @first_final_price = @first_final_price - @deducted_second


        #         logger.info("Final price after  Paint EGP - " + @first_final_price.to_s)

  end


      if @valuation.engine_problem == true

        logger.info("CALCULATING ENGINE DISCOUNT")
        
        @engine_percentage = 0
 logger.info("Engin Condition:   " + @valuation.engine_condition.to_s)


          if @valuation.engine_condition == "damaged"
@condition_string = "bad"
          @engine_percentage = @tier.engine_damaged

        elsif @valuation.engine_condition == "repaired"
@condition_string = "average"
          @engine_percentage = @tier.engine_repaired    
        
        elsif @valuation.engine_condition == "changed"
@condition_string = "average"
          @engine_percentage = @tier.engine_changed    

        end



       # @deducted_third =  (@engine_percentage.to_f * @first_final_price) / 100

        @deducted_third = @engine_percentage
        #@first_final_price = @first_final_price - @deducted_third


        logger.info("Engine % - " + @engine_percentage.to_s)

        logger.info("Third Engine Deduction - " + @deducted_third.to_s)
      end


      if @valuation.accident == true

        logger.info("CALCULATING ACCIDENT DISCOUNT")
        @condition_string = "risky"
        @roof_accident_percentage = 0
       


        @front_middle_bumper_accident_percentage = 0
   



        @left_front_bumper_accident_percentage = 0
    



        @right_front_bumper_accident_percentage = 0
  



        @right_front_door_accident_percentage = 0
     



        @right_back_door_accident_percentage = 0
   


        @left_front_door_accident_percentage = 0
  



        @left_back_door_accident_percentage = 0
     



        @middle_back_bumper_accident_percentage = 0
   



        @left_back_bumper_accident_percentage = 0
     


        @right_back_bumper_accident_percentage = 0
    



#Roof
        if @valuation.accident_second_top == "damaged"

          @roof_accident_percentage = @tier.roof_damaged

        elsif @valuation.accident_second_top == "repaired"

          @roof_accident_percentage = @tier.roof_damaged_repaired    
        
        elsif @valuation.accident_second_top == "changed"
        
          @roof_accident_percentage = @tier.roof_damaged_changed    

        end

logger.info("Roof: " + @roof_accident_percentage.to_s + " %")

#Middle Bumper
        if @valuation.accident_lights_hood == "damaged"

          @front_middle_bumper_accident_percentage = @tier.front_middle_bumper_damaged

        elsif @valuation.accident_lights_hood == "repaired"

          @front_middle_bumper_accident_percentage = @tier.front_middle_bumper_repaired    
        
        elsif @valuation.accident_lights_hood == "changed"

          @front_middle_bumper_accident_percentage = @tier.front_middle_bumper_changed    

        end

logger.info("Middle Front Bumper: " + @front_middle_bumper_accident_percentage.to_s + " %")

#Left Bumper
        if @valuation.accident_lights_left_front == "damaged"

          @left_front_bumper_accident_percentage = @tier.left_front_bumper_damaged

        elsif @valuation.accident_lights_left_front == "repaired"

          @left_front_bumper_accident_percentage = @tier.left_front_bumper_repaired    
        
        elsif @valuation.accident_lights_left_front == "changed"

          @left_front_bumper_accident_percentage = @tier.left_front_bumper_changed   

        end



logger.info("Left Front Bumper: " + @left_front_bumper_accident_percentage.to_s + " %")
#Right Bumper
        if @valuation.accident_lights_right_front == "damaged"

          @right_front_bumper_accident_percentage = @tier.right_front_bumper_damaged

        elsif @valuation.accident_lights_right_front == "repaired"

          @right_front_bumper_accident_percentage = @tier.right_front_bumper_repaired   
        
        elsif @valuation.accident_lights_right_front == "changed"

          @right_front_bumper_accident_percentage = @tier.right_front_bumper_changed  

        end

logger.info("Right Front Bumper: " + @left_front_bumper_accident_percentage.to_s + " %")

#Right Front Door
        if @valuation.accident_second_side == "damaged"

          @right_front_door_accident_percentage = @tier.right_front_door_damaged

        elsif @valuation.accident_second_side == "repaired"

          @right_front_door_accident_percentage = @tier.right_front_door_repaired   
        
        elsif @valuation.accident_second_side == "changed"

          @right_front_door_accident_percentage = @tier.right_front_door_changed  

        end


logger.info("Right Front Door: " + @right_front_door_accident_percentage.to_s + " %")


#Right Back Door
        if @valuation.accident_third_side == "damaged"

          @right_back_door_accident_percentage = @tier.right_back_door_damaged

        elsif @valuation.accident_third_side == "repaired"

          @right_back_door_accident_percentage = @tier.right_back_door_repaired   
        
        elsif @valuation.accident_third_side == "changed"

          @right_back_door_accident_percentage = @tier.right_back_door_changed  

        end


logger.info("Right Back Door: " + @right_back_door_accident_percentage.to_s + " %")


#Left Front Door
        if @valuation.accident_second_left_side == "damaged"

          @left_front_door_accident_percentage = @tier.left_front_door_damaged

        elsif @valuation.accident_second_left_side == "repaired"

          @left_front_door_accident_percentage = @tier.left_front_door_repaired   
        
        elsif @valuation.accident_second_left_side == "changed"

          @left_front_door_accident_percentage = @tier.left_front_door_changed  

        end
logger.info("Left Front Door: " + @left_front_door_accident_percentage.to_s + " %")


#Left Back Door
        if @valuation.accident_third_left_side == "damaged"

          @left_back_door_accident_percentage = @tier.left_back_door_damaged

        elsif @valuation.accident_third_left_side == "repaired"

          @left_back_door_accident_percentage = @tier.left_back_door_repaired   
        
        elsif @valuation.accident_third_left_side == "changed"

          @left_back_door_accident_percentage = @tier.left_back_door_changed  

        end

logger.info("Left Back Door: " + @left_back_door_accident_percentage.to_s + " %")








#Left Back Bumper
        if @valuation.accident_left_back == "damaged"

          @left_back_bumper_accident_percentage = @tier.left_back_bumper_damaged

        elsif @valuation.accident_left_back == "repaired"

          @left_back_bumper_accident_percentage = @tier.left_back_bumper_repaired    
        
        elsif @valuation.accident_left_back == "changed"

          @left_back_bumper_accident_percentage = @tier.left_back_bumper_changed   

        end

logger.info("Left Back Bumper: " + @left_back_bumper_accident_percentage.to_s + " %")


#Right Back Bumper
        if @valuation.accident_right_back == "damaged"

          @right_back_bumper_accident_percentage = @tier.right_back_bumper_damaged

        elsif @valuation.accident_right_back == "repaired"

          @right_back_bumper_accident_percentage = @tier.right_back_bumper_repaired   
        
         elsif @valuation.accident_right_back == "changed"

          @right_back_bumper_accident_percentage = @tier.right_back_bumper_changed  

        end

logger.info("Right Back Bumper: " + @right_back_bumper_accident_percentage.to_s + " %")

#Middle Back Bumper
        if @valuation.accident_middle_back == "damaged"

          @back_middle_bumper_accident_percentage = @tier.middle_back_bumper_damaged

        elsif @valuation.accident_middle_back == "repaired"

          @back_middle_bumper_accident_percentage = @tier.middle_back_bumper_repaired    
        
        elsif @valuation.accident_middle_back == "changed"

          @back_middle_bumper_accident_percentage = @tier.middle_back_bumper_changed   

        end

logger.info("Middle Back Bumper: " + @back_middle_bumper_accident_percentage.to_s + " %")




      @fourth_percentages = @roof_accident_percentage + @front_middle_bumper_accident_percentage + @left_front_bumper_accident_percentage + @right_front_bumper_accident_percentage  + @right_front_door_accident_percentage + @right_back_door_accident_percentage + @left_front_door_accident_percentage + @left_back_door_accident_percentage + @middle_back_bumper_accident_percentage + @left_back_bumper_accident_percentage + @right_back_bumper_accident_percentage

      #@deducted_fourth =  (@fourth_percentages.to_f * @first_final_price) / 100

        @deducted_fourth = @fourth_percentages
       # @first_final_price = @first_final_price - @deducted_fourth


        logger.info("SUM ACCIDENT % - " + @fourth_percentages.to_s)

          logger.info("Deducting EGP in ACCIDENT % - " + @deducted_fourth.to_s)
     #logger.info("Final price EGP after ACCIDENT % - " + @first_final_price.to_s)
      end

      @deduction_paint_engine_accident = @deducted_fourth.to_f + @deducted_third.to_f + @deducted_second.to_f
      

        logger.info("Deduction paint accident engine: % - " + @deduction_paint_engine_accident.to_s)

      if @deduction_paint_engine_accident != 0
      @m = 100 - @deduction_paint_engine_accident

      logger.info("M = 100  - Deduction paint accident engine = " + @m.to_s)

      @first_final_price = (@first_final_price * @m) / 100

    end



      @valuation.final_price = @first_final_price
      @valuation.final_condition = @condition_string
      
      @valuation.save
      logger.info("wooooow")
        format.html { redirect_to @valuation }
        format.json { render :show, status: :created, location: @valuation }
      else
        format.html { render :new }
        format.json { render json: @valuation.errors, status: :unprocessable_entity }
      end
    end

	end


	def getMessages


		@messages = Message.all

		render :json => @messages

	end



	def send_message


		@message = Message.new

		if params[:admin_id]

			@message.admin_id =  params[:admin_id]
			@message.user_id =  params[:user_id]
			@message.text = params[:text]
			@message.subject = params[:subject]
			@message.save!

		else

			@message.admin_id =  Admin.all[0].id
			@message.user_id =  params[:user_id]
			@message.text = params[:text]
			@message.subject = params[:subject]
			@message.save!
		end

			redirect_to messages_url


	end







	def send_message_to_user

		@conversation = Conversation.find_by_user_id(params[:user_id])

		if @conversation

           @message = Message.new
           @message.user_id = params[:user_id]
           @message.user_id = params[:admin_id]
           @message.text = params[:text_to_send]
           @message.conversation_id = @conversation.id
           @message.save

		else
			@conversation = Conversation.new
			@conversation.user_id = params[:user_id]
			@conversation.admin_id = params[:admin_id]
			@conversation.save

			@message = Message.new
           @message.user_id = params[:user_id]
           @message.user_id = params[:admin_id]
           @message.text = params[:text_to_send]
           @message.conversation_id = @conversation.id
           @message.save

		end

		redirect_to admin_dashboard_url



	end



	def send_message_to_admin

		@conversation = Conversation.find_by_user_id(params[:admin_id])

		if @conversation

           @message = Message.new
           @message.user_id = params[:user_id]
           @message.user_id = params[:admin_id]
           @message.text = params[:text_to_send]
           @message.conversation_id = @conversation.id
           @message.save

		else
			@conversation = Conversation.new
			@conversation.user_id = params[:user_id]
			@conversation.admin_id = params[:admin_id]
			@conversation.save

			@message = Message.new
           @message.user_id = params[:user_id]
           @message.user_id = params[:admin_id]
           @message.text = params[:text_to_send]
           @message.conversation_id = @conversation.id
           @message.save

		end

		redirect_to profile_url


	end




	def user_registration


				@user = User.find_by_email(params[:user][:email])

				if @user

					redirect_to root_url

				else
						
					

		
			      if params[:user][:password] == params[:user][:password_confirmation]
			      	@user = User.new(user_params)
			      	@user.save

			      	UserMailer.registration_confirmation(@user).deliver
			      	#session[:user_id] = @user.id
			        redirect_to root_url
			      else


			        redirect_to root_url
			      end

   				end

	end


	def update_user_info

		@user = User.find(params[:user_id])
		@user.name = params[:name]
		@user.email = params[:email]
		@user.phone = params[:phone]
		@user.password = params[:password]
		@user.password_confirmation = params[:password_confirmation]
		@user.save

		redirect_to profile_url

	end


	def register_user_js



				@user = User.find_by_email(params[:email])

				if @user

					render :json => {:Status => "An account already exists with this email"}.to_json() 

				else
						
					

		
			      if params[:password] == params[:password_confirmation]
			      	@user = User.new
			      	@user.email = params[:email]
			      	@user.password = params[:password]
			      	@user.password_confirmation = params[:password_confirmation]
			      	@user.save
			      	if session[:admin_id]

						session[:admin_id] = nil

					end

			      	@daily = DailyVisitor.new

				
						@daily.user_email = @user.email
						@daily.save


						@user_stat = UserStat.new

						@user_stat.state = "Active"
						@user_stat.email = @user.email
						@user_stat.save

			      	UserMailer.registration_confirmation(@user).deliver
			      	#session[:user_id] = @user.id
			        render :json => {:Status => "Please confirm your email to login to your account"}.to_json() 
			      else


			        render :json => {:Status => "Password does not match password confirmation"}.to_json() 
			      end

   				end




	end


	def send_password_reset

		if params[:email]

			user = User.find_by_email(params[:email])
			if user
		  		user.send_password_reset 
				render :json => {:Status => "Email sent with password reset instructions"}.to_json() 
			else
			
				render :json => {:Status => "No account was found with that email"}.to_json() 

			end	
		else

			render :json => {:Status => "Please enter your email"}.to_json() 
		end


		
	end



	def login_user_js


		@user = User.find_by_email(params[:email])

		if @user

			if @user.authenticate(params[:password])

					# if @user.email_confirmed == true
					
					# else

						
					# 	render :json => {:Status => "You have to confirm your email"}.to_json() 
					# end


						session[:user_id] = @user.id
						@user.active_flag = true
						@user.save
						@user_stat = UserStat.new

						@user_stat.state = "Active"
						@user_stat.email = @user.email
						@user_stat.save


					if session[:admin_id]

						session[:admin_id] = nil

					end
						@daily = DailyVisitor.new

				
						@daily.user_email = @user.email
						@daily.save




						render :json => {:Status => "Login in"}.to_json() 
						
			else
				render :json => {:Status => "Your email does not match your password"}.to_json() 

			end


		else
			@user = User.find_by_phone(params[:email])

			if @user

				if @user.authenticate(params[:password])

						session[:user_id] = @user.id
						@user.active_flag = true
						@user.save
						@user_stat = UserStat.new

						@user_stat.state = "Active"
						@user_stat.email = @user.email
						@user_stat.save

		
						render :json => {:Status => "Login in"}.to_json() 
				
				else
				render :json => {:Status => "Your phone does not match your password"}.to_json() 
				end

			else

			render :json => {:Status => "No account with those details where found"}.to_json() 

			end

			
		end

	end



	def goUser
		@user = User.find_by_email(params[:email])

		if @user

			if @user.authenticate(params[:password])

					if @user.email_confirmed
						@user.active_flag = true
						@user.save
						session[:user_id] = @user.id

						redirect_to root_url
					else

						
						redirect_to root_url
					end
			else
				redirect_to root_url

			end


		else
			@user = User.find_by_phone(params[:email])

			if @user

				if @user.authenticate(params[:password])

					if @user.email_confirmed
						session[:user_id] = @user.id
						@user.active_flag = true
						@user.save
						redirect_to root_url
					else


						redirect_to root_url
					end

				
			else
				redirect_to root_url

			end

			else

				redirect_to root_url

			end

			
		end

	end


def admin_dashboard


end

	def goAdmin

		@admin = Admin.find_by_email(params[:email])

		if @admin

			if @admin.authenticate(params[:password])

				session[:admin_id] = @admin.id

				if @admin.level == "Administrator"


					if session[:user_id]

						session[:user_id] = nil

					end
					redirect_to admin_dashboard_url

				else
					redirect_to brands_url

				end

				
			else
				redirect_to administrator_url

			end


		else

			redirect_to administrator_url
		end


	end


	def logout_admin

		session[:admin_id] = nil
		redirect_to root_url


	end



	def logout
		@user = User.find(session[:user_id])
		session[:user_id] = nil
		@user.active_flag = false
						@user.save


						@user_stat = UserStat.new

		@user_stat.state = "Inactive"
		@user_stat.email = @user.email
		@user_stat.save



		redirect_to root_url

	end


 private
    # Use callbacks to share common setup or constraints between actions.
 
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:owner).permit(:password, :password_confirmation)
    end


    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password_digest, :password, :password_confirmation, :phone)
    end
    def set_valuation
      @valuation = Valuation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def valuation_params
      params.require(:valuation).permit(:paint_lights_left_front,:paint_third_side, :paint_second_side,:paint_first_side,:paint_lights_right_front,:paint_lights_hood,:accident_second_top, :accident_third_top, :accident_middle_back, :accident_right_back,:accident_first_top,:accident_fourth_side, :accident_third_side, :accident_second_side, :accident_first_side,:accident_lights_right_front,:accident_lights_hood,:paint_fourth_side, :paint_right_back,:paint_first_top,:paint_middle_back, :paint_left_back, :paint_third_top,:paint_second_top,:accident_lights_left_front, :accident_left_back, :paint_second_left_side, :paint_third_left_side, :accident_second_left_side, :accident_third_left_side, :user_id, :valuation_type, :number_owners, :brakes, :electrical, :rims, :seats, :steering, :transmission, :tyres,:suspension, :engine_condition, :notes_engine, :car_paint, :engine_problem, :accident, :ac, :radio, :type_Seller_buyer, :brand, :trim_select, :year_car_end, :year_car, :model_car, :kilometers, :final_price, :final_condition)


    end






end
