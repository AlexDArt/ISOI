require 'test_helper'

class SocialObjectsControllerTest < ActionController::TestCase
  setup do
    @social_object = social_objects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:social_objects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create social_object" do
    assert_difference('SocialObject.count') do
      post :create, social_object: { address: @social_object.address, boiler_house_id: @social_object.boiler_house_id, coordinates: @social_object.coordinates, director: @social_object.director, phones_of_director: @social_object.phones_of_director, phones_of_operators: @social_object.phones_of_operators, transformer_substation_id: @social_object.transformer_substation_id, type: @social_object.type, water_intake_unit_id: @social_object.water_intake_unit_id }
    end

    assert_redirected_to social_object_path(assigns(:social_object))
  end

  test "should show social_object" do
    get :show, id: @social_object
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @social_object
    assert_response :success
  end

  test "should update social_object" do
    patch :update, id: @social_object, social_object: { address: @social_object.address, boiler_house_id: @social_object.boiler_house_id, coordinates: @social_object.coordinates, director: @social_object.director, phones_of_director: @social_object.phones_of_director, phones_of_operators: @social_object.phones_of_operators, transformer_substation_id: @social_object.transformer_substation_id, type: @social_object.type, water_intake_unit_id: @social_object.water_intake_unit_id }
    assert_redirected_to social_object_path(assigns(:social_object))
  end

  test "should destroy social_object" do
    assert_difference('SocialObject.count', -1) do
      delete :destroy, id: @social_object
    end

    assert_redirected_to social_objects_path
  end
end
