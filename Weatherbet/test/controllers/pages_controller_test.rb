require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get pages_home_url
    assert_response :success
  end

  test "should get weather" do
    get pages_weather_url
    assert_response :success
  end

  test "should get locations" do
    get pages_locations_url
    assert_response :success
  end

end
