require 'test_helper'

class PriceRangesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @price_range = price_ranges(:one)
  end

  test "should get index" do
    get price_ranges_url
    assert_response :success
  end

  test "should get new" do
    get new_price_range_url
    assert_response :success
  end

  test "should create price_range" do
    assert_difference('PriceRange.count') do
      post price_ranges_url, params: { price_range: { from: @price_range.from, to: @price_range.to } }
    end

    assert_redirected_to price_range_url(PriceRange.last)
  end

  test "should show price_range" do
    get price_range_url(@price_range)
    assert_response :success
  end

  test "should get edit" do
    get edit_price_range_url(@price_range)
    assert_response :success
  end

  test "should update price_range" do
    patch price_range_url(@price_range), params: { price_range: { from: @price_range.from, to: @price_range.to } }
    assert_redirected_to price_range_url(@price_range)
  end

  test "should destroy price_range" do
    assert_difference('PriceRange.count', -1) do
      delete price_range_url(@price_range)
    end

    assert_redirected_to price_ranges_url
  end
end
