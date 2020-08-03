require 'test_helper'

class HousesControllerTest < ActionController::TestCase
  setup do
    @house = houses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:houses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create house" do
    assert_difference('House.count') do
      post :create, house: { boiler_house_id: @house.boiler_house_id, coordinates: @house.coordinates, gasified: @house.gasified, managment_company_id: @house.managment_company_id, number: @house.number, number_of_apartments: @house.number_of_apartments, number_of_entrances: @house.number_of_entrances, number_of_floors: @house.number_of_floors, street: @house.street, transformer_substation_id: @house.transformer_substation_id, type_of_roof: @house.type_of_roof, water_intake_unit_id: @house.water_intake_unit_id, year_of_construction: @house.year_of_construction }
    end

    assert_redirected_to house_path(assigns(:house))
  end

  test "should show house" do
    get :show, id: @house
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @house
    assert_response :success
  end

  test "should update house" do
    patch :update, id: @house, house: { boiler_house_id: @house.boiler_house_id, coordinates: @house.coordinates, gasified: @house.gasified, managment_company_id: @house.managment_company_id, number: @house.number, number_of_apartments: @house.number_of_apartments, number_of_entrances: @house.number_of_entrances, number_of_floors: @house.number_of_floors, street: @house.street, transformer_substation_id: @house.transformer_substation_id, type_of_roof: @house.type_of_roof, water_intake_unit_id: @house.water_intake_unit_id, year_of_construction: @house.year_of_construction }
    assert_redirected_to house_path(assigns(:house))
  end

  test "should destroy house" do
    assert_difference('House.count', -1) do
      delete :destroy, id: @house
    end

    assert_redirected_to houses_path
  end
end
