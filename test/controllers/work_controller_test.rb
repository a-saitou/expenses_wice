require 'test_helper'

class WorkControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get data" do
    get :data
    assert_response :success
  end

  test "should get db_action" do
    get :db_action
    assert_response :success
  end

end
