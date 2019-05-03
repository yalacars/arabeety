require 'test_helper'

class ValuationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @valuation = valuations(:one)
  end

  test "should get index" do
    get valuations_url
    assert_response :success
  end

  test "should get new" do
    get new_valuation_url
    assert_response :success
  end

  test "should create valuation" do
    assert_difference('Valuation.count') do
      post valuations_url, params: { valuation: { ac: @valuation.ac, accident: @valuation.accident, brand: @valuation.brand, car_paint: @valuation.car_paint, engine_condition: @valuation.engine_condition, engine_problem: @valuation.engine_problem, kilometers: @valuation.kilometers, model_car: @valuation.model_car, notes_engine: @valuation.notes_engine, radio: @valuation.radio, trim_select: @valuation.trim_select, type_Seller_buyer: @valuation.type_Seller_buyer, user_id: @valuation.user_id, year_car: @valuation.year_car } }
    end

    assert_redirected_to valuation_url(Valuation.last)
  end

  test "should show valuation" do
    get valuation_url(@valuation)
    assert_response :success
  end

  test "should get edit" do
    get edit_valuation_url(@valuation)
    assert_response :success
  end

  test "should update valuation" do
    patch valuation_url(@valuation), params: { valuation: { ac: @valuation.ac, accident: @valuation.accident, brand: @valuation.brand, car_paint: @valuation.car_paint, engine_condition: @valuation.engine_condition, engine_problem: @valuation.engine_problem, kilometers: @valuation.kilometers, model_car: @valuation.model_car, notes_engine: @valuation.notes_engine, radio: @valuation.radio, trim_select: @valuation.trim_select, type_Seller_buyer: @valuation.type_Seller_buyer, user_id: @valuation.user_id, year_car: @valuation.year_car } }
    assert_redirected_to valuation_url(@valuation)
  end

  test "should destroy valuation" do
    assert_difference('Valuation.count', -1) do
      delete valuation_url(@valuation)
    end

    assert_redirected_to valuations_url
  end
end
