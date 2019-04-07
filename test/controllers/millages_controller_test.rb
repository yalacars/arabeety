require 'test_helper'

class MillagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @millage = millages(:one)
  end

  test "should get index" do
    get millages_url
    assert_response :success
  end

  test "should get new" do
    get new_millage_url
    assert_response :success
  end

  test "should create millage" do
    assert_difference('Millage.count') do
      post millages_url, params: { millage: { range: @millage.range } }
    end

    assert_redirected_to millage_url(Millage.last)
  end

  test "should show millage" do
    get millage_url(@millage)
    assert_response :success
  end

  test "should get edit" do
    get edit_millage_url(@millage)
    assert_response :success
  end

  test "should update millage" do
    patch millage_url(@millage), params: { millage: { range: @millage.range } }
    assert_redirected_to millage_url(@millage)
  end

  test "should destroy millage" do
    assert_difference('Millage.count', -1) do
      delete millage_url(@millage)
    end

    assert_redirected_to millages_url
  end
end
