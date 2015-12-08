require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { address: @user.address, email: @user.email, expiration_date: @user.expiration_date, name: @user.name, personal_number: @user.personal_number, phone_number: @user.phone_number, registration_date: @user.registration_date, user_role: @user.user_role }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { address: @user.address, email: @user.email, expiration_date: @user.expiration_date, name: @user.name, personal_number: @user.personal_number, phone_number: @user.phone_number, registration_date: @user.registration_date, user_role: @user.user_role }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
