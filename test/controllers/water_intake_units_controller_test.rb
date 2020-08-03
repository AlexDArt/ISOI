require 'test_helper'

class WaterIntakeUnitsControllerTest < ActionController::TestCase
  setup do
    @water_intake_unit = water_intake_units(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:water_intake_units)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create water_intake_unit" do
    assert_difference('WaterIntakeUnit.count') do
      post :create, water_intake_unit: { address: @water_intake_unit.address, coordinates: @water_intake_unit.coordinates, phones_of_operators: @water_intake_unit.phones_of_operators }
    end

    assert_redirected_to water_intake_unit_path(assigns(:water_intake_unit))
  end

  test "should show water_intake_unit" do
    get :show, id: @water_intake_unit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @water_intake_unit
    assert_response :success
  end

  test "should update water_intake_unit" do
    patch :update, id: @water_intake_unit, water_intake_unit: { address: @water_intake_unit.address, coordinates: @water_intake_unit.coordinates, phones_of_operators: @water_intake_unit.phones_of_operators }
    assert_redirected_to water_intake_unit_path(assigns(:water_intake_unit))
  end

  test "should destroy water_intake_unit" do
    assert_difference('WaterIntakeUnit.count', -1) do
      delete :destroy, id: @water_intake_unit
    end

    assert_redirected_to water_intake_units_path
  end
end
