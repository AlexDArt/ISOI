require 'test_helper'

class ShoppingCentersControllerTest < ActionController::TestCase
  setup do
    @shopping_center = shopping_centers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shopping_centers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shopping_center" do
    assert_difference('ShoppingCenter.count') do
      post :create, shopping_center: { attic: @shopping_center.attic, basement: @shopping_center.basement, boiler_house_id_id: @shopping_center.boiler_house_id_id, elevator: @shopping_center.elevator, latitude: @shopping_center.latitude, longitude: @shopping_center.longitude, maximum_working_shift: @shopping_center.maximum_working_shift, number: @shopping_center.number, number_of_entrances: @shopping_center.number_of_entrances, number_of_floors: @shopping_center.number_of_floors, owner: @shopping_center.owner, settlement: @shopping_center.settlement, street: @shopping_center.street, transformer_substation_id_id: @shopping_center.transformer_substation_id_id, type_of_roof: @shopping_center.type_of_roof, underground_parking: @shopping_center.underground_parking, water_intake_unit_id_id: @shopping_center.water_intake_unit_id_id }
    end

    assert_redirected_to shopping_center_path(assigns(:shopping_center))
  end

  test "should show shopping_center" do
    get :show, id: @shopping_center
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shopping_center
    assert_response :success
  end

  test "should update shopping_center" do
    patch :update, id: @shopping_center, shopping_center: { attic: @shopping_center.attic, basement: @shopping_center.basement, boiler_house_id_id: @shopping_center.boiler_house_id_id, elevator: @shopping_center.elevator, latitude: @shopping_center.latitude, longitude: @shopping_center.longitude, maximum_working_shift: @shopping_center.maximum_working_shift, number: @shopping_center.number, number_of_entrances: @shopping_center.number_of_entrances, number_of_floors: @shopping_center.number_of_floors, owner: @shopping_center.owner, settlement: @shopping_center.settlement, street: @shopping_center.street, transformer_substation_id_id: @shopping_center.transformer_substation_id_id, type_of_roof: @shopping_center.type_of_roof, underground_parking: @shopping_center.underground_parking, water_intake_unit_id_id: @shopping_center.water_intake_unit_id_id }
    assert_redirected_to shopping_center_path(assigns(:shopping_center))
  end

  test "should destroy shopping_center" do
    assert_difference('ShoppingCenter.count', -1) do
      delete :destroy, id: @shopping_center
    end

    assert_redirected_to shopping_centers_path
  end
end
