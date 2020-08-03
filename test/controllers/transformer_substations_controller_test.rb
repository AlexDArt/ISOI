require 'test_helper'

class TransformerSubstationsControllerTest < ActionController::TestCase
  setup do
    @transformer_substation = transformer_substations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transformer_substations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transformer_substation" do
    assert_difference('TransformerSubstation.count') do
      post :create, transformer_substation: { address: @transformer_substation.address, coordinates: @transformer_substation.coordinates, phones_of_operators: @transformer_substation.phones_of_operators }
    end

    assert_redirected_to transformer_substation_path(assigns(:transformer_substation))
  end

  test "should show transformer_substation" do
    get :show, id: @transformer_substation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @transformer_substation
    assert_response :success
  end

  test "should update transformer_substation" do
    patch :update, id: @transformer_substation, transformer_substation: { address: @transformer_substation.address, coordinates: @transformer_substation.coordinates, phones_of_operators: @transformer_substation.phones_of_operators }
    assert_redirected_to transformer_substation_path(assigns(:transformer_substation))
  end

  test "should destroy transformer_substation" do
    assert_difference('TransformerSubstation.count', -1) do
      delete :destroy, id: @transformer_substation
    end

    assert_redirected_to transformer_substations_path
  end
end
