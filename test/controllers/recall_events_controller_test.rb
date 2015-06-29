require 'test_helper'

class RecallEventsControllerTest < ActionController::TestCase
  setup do
    @recall_event = recall_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recall_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recall_event" do
    assert_difference('RecallEvent.count') do
      post :create, recall_event: {  }
    end

    assert_redirected_to recall_event_path(assigns(:recall_event))
  end

  test "should show recall_event" do
    get :show, id: @recall_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recall_event
    assert_response :success
  end

  test "should update recall_event" do
    patch :update, id: @recall_event, recall_event: {  }
    assert_redirected_to recall_event_path(assigns(:recall_event))
  end

  test "should destroy recall_event" do
    assert_difference('RecallEvent.count', -1) do
      delete :destroy, id: @recall_event
    end

    assert_redirected_to recall_events_path
  end
end
