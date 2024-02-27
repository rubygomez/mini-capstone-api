require "test_helper"

class ProductControllerTest < ActionDispatch::IntegrationTest
  test "should get name:string" do
    get product_name:string_url
    assert_response :success
  end

  test "should get price:integer" do
    get product_price:integer_url
    assert_response :success
  end

  test "should get image_url:string" do
    get product_image_url:string_url
    assert_response :success
  end

  test "should get description:string" do
    get product_description:string_url
    assert_response :success
  end
end
