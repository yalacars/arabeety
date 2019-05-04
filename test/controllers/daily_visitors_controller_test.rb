require 'test_helper'

class DailyVisitorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @daily_visitor = daily_visitors(:one)
  end

  test "should get index" do
    get daily_visitors_url
    assert_response :success
  end

  test "should get new" do
    get new_daily_visitor_url
    assert_response :success
  end

  test "should create daily_visitor" do
    assert_difference('DailyVisitor.count') do
      post daily_visitors_url, params: { daily_visitor: { user_email: @daily_visitor.user_email } }
    end

    assert_redirected_to daily_visitor_url(DailyVisitor.last)
  end

  test "should show daily_visitor" do
    get daily_visitor_url(@daily_visitor)
    assert_response :success
  end

  test "should get edit" do
    get edit_daily_visitor_url(@daily_visitor)
    assert_response :success
  end

  test "should update daily_visitor" do
    patch daily_visitor_url(@daily_visitor), params: { daily_visitor: { user_email: @daily_visitor.user_email } }
    assert_redirected_to daily_visitor_url(@daily_visitor)
  end

  test "should destroy daily_visitor" do
    assert_difference('DailyVisitor.count', -1) do
      delete daily_visitor_url(@daily_visitor)
    end

    assert_redirected_to daily_visitors_url
  end
end
