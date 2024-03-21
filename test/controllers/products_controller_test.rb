require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/products.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Product.count, data.length
  end

  test "create" do
    assert_difference "Product.count", 1 do
      post "/products.json", params: { supplier_id: Supplier.first.id, price: 10, description: "test descriptionnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn", quantity: 1, image_id: 1}
      data = JSON.parse(response.body)
      assert_response 200
      refute_nil data["id"]
      assert_equal "test descriptionnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn", data["description"]
    end

    assert_difference "Product.count", 0 do
      post "/products.json", params: {}
      assert_response 422
    end
  end

  test "show" do
    get "/products/#{Product.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "name", "price", "is_discounted?", "tax", "total", "description", "supplier", "supplier_id", "image_id", "quantity"], data.keys
  end

  test "update" do
    product = Product.first
    patch "/products/#{product.id}.json", params: { name: "Updated name", description: "longgggggggggggggggggg ggggggg", price: 1, quantity: 1, supplier_id: Supplier.first.id, image_id: 1}
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
    assert_equal 1, data["price"]
    assert_equal "longgggggggggggggggggg ggggggg", data["description"]
    assert_equal Supplier.first.id, data["supplier_id"]
    assert_difference "Product.count", 0 do
      post "/products.json", params: {description:"yo"}
      assert_response 422
    end

    # patch "/products/#{product.id}.json", params: { name: ""}
    # assert_response 422
  end

  test "destroy" do
    assert_difference "Product.count", -1 do
      delete "/products/#{Product.first.id}.json"
      assert_response 200
    end
  end

  
end
