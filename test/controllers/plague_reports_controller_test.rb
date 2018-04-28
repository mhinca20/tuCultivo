require 'test_helper'

class PlagueReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get plague_reports_create_url
    assert_response :success
  end

end
