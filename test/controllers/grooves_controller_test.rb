require 'test_helper'

class GroovesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @groofe = grooves(:one)
  end

  test "should get index" do
    get grooves_url
    assert_response :success
  end

  test "should get new" do
    get new_groofe_url
    assert_response :success
  end

  test "should create groofe" do
    assert_difference('Groove.count') do
      post grooves_url, params: { groofe: { lot_id: @groofe.lot_id, quantity: @groofe.quantity } }
    end

    assert_redirected_to groofe_url(Groove.last)
  end

  test "should show groofe" do
    get groofe_url(@groofe)
    assert_response :success
  end

  test "should get edit" do
    get edit_groofe_url(@groofe)
    assert_response :success
  end

  test "should update groofe" do
    patch groofe_url(@groofe), params: { groofe: { lot_id: @groofe.lot_id, quantity: @groofe.quantity } }
    assert_redirected_to groofe_url(@groofe)
  end

  test "should destroy groofe" do
    assert_difference('Groove.count', -1) do
      delete groofe_url(@groofe)
    end

    assert_redirected_to grooves_url
  end
end
