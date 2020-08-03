require 'test_helper'

class BoilerHousesControllerTest < ActionController::TestCase
  setup do
    @boiler_house = boiler_houses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:boiler_houses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create boiler_house" do
    assert_difference('BoilerHouse.count') do
      post :create, boiler_house: { address: @boiler_house.address, coordinates: @boiler_house.coordinates, phones_of_operators: @boiler_house.phones_of_operators }
    end

    assert_redirected_to boiler_house_path(assigns(:boiler_house))
  end

  test "should show boiler_house" do
    get :show, id: @boiler_house
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @boiler_house
    assert_response :success
  end

  test "should update boiler_house" do
    patch :update, id: @boiler_house, boiler_house: { address: @boiler_house.address, coordinates: @boiler_house.coordinates, phones_of_operators: @boiler_house.phones_of_operators }
    assert_redirected_to boiler_house_path(assigns(:boiler_house))
  end

  test "should destroy boiler_house" do
    assert_difference('BoilerHouse.count', -1) do
      delete :destroy, id: @boiler_house
    end

    assert_redirected_to boiler_houses_path
  end
end
