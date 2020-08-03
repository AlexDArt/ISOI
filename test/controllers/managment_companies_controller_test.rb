require 'test_helper'

class ManagmentCompaniesControllerTest < ActionController::TestCase
  setup do
    @managment_company = managment_companies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:managment_companies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create managment_company" do
    assert_difference('ManagmentCompany.count') do
      post :create, managment_company: { address: @managment_company.address, coordinates: @managment_company.coordinates, director: @managment_company.director, phones_of_director: @managment_company.phones_of_director, phones_of_operators: @managment_company.phones_of_operators }
    end

    assert_redirected_to managment_company_path(assigns(:managment_company))
  end

  test "should show managment_company" do
    get :show, id: @managment_company
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @managment_company
    assert_response :success
  end

  test "should update managment_company" do
    patch :update, id: @managment_company, managment_company: { address: @managment_company.address, coordinates: @managment_company.coordinates, director: @managment_company.director, phones_of_director: @managment_company.phones_of_director, phones_of_operators: @managment_company.phones_of_operators }
    assert_redirected_to managment_company_path(assigns(:managment_company))
  end

  test "should destroy managment_company" do
    assert_difference('ManagmentCompany.count', -1) do
      delete :destroy, id: @managment_company
    end

    assert_redirected_to managment_companies_path
  end
end
