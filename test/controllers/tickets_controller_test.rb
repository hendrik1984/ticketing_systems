require "test_helper"

class TicketsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get tickets_new_url
    assert_response :success
  end
end
