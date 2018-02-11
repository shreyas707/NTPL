require 'test_helper'

class SaudasControllerTest < ActionController::TestCase
  setup do
    @sauda = saudas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:saudas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sauda" do
    assert_difference('Sauda.count') do
      post :create, sauda: { customer_id: @sauda.customer_id, date: @sauda.date, is_delivered: @sauda.is_delivered, is_order_taken: @sauda.is_order_taken, number: @sauda.number }
    end

    assert_redirected_to sauda_path(assigns(:sauda))
  end

  test "should show sauda" do
    get :show, id: @sauda
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sauda
    assert_response :success
  end

  test "should update sauda" do
    patch :update, id: @sauda, sauda: { customer_id: @sauda.customer_id, date: @sauda.date, is_delivered: @sauda.is_delivered, is_order_taken: @sauda.is_order_taken, number: @sauda.number }
    assert_redirected_to sauda_path(assigns(:sauda))
  end

  test "should destroy sauda" do
    assert_difference('Sauda.count', -1) do
      delete :destroy, id: @sauda
    end

    assert_redirected_to saudas_path
  end
end
