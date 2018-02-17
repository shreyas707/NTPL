require 'test_helper'

class DeliverProductsControllerTest < ActionController::TestCase
  setup do
    @deliver_product = deliver_products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:deliver_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create deliver_product" do
    assert_difference('DeliverProduct.count') do
      post :create, deliver_product: { delivery_id: @deliver_product.delivery_id, delivery_quantity: @deliver_product.delivery_quantity, price: @deliver_product.price, product_id: @deliver_product.product_id }
    end

    assert_redirected_to deliver_product_path(assigns(:deliver_product))
  end

  test "should show deliver_product" do
    get :show, id: @deliver_product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @deliver_product
    assert_response :success
  end

  test "should update deliver_product" do
    patch :update, id: @deliver_product, deliver_product: { delivery_id: @deliver_product.delivery_id, delivery_quantity: @deliver_product.delivery_quantity, price: @deliver_product.price, product_id: @deliver_product.product_id }
    assert_redirected_to deliver_product_path(assigns(:deliver_product))
  end

  test "should destroy deliver_product" do
    assert_difference('DeliverProduct.count', -1) do
      delete :destroy, id: @deliver_product
    end

    assert_redirected_to deliver_products_path
  end
end
