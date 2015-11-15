require 'test_helper'

class ContactsEventsControllerTest < ActionController::TestCase
  setup do
    @contacts_event = contacts_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contacts_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contacts_event" do
    assert_difference('ContactsEvent.count') do
      post :create, contacts_event: { contact_id: @contacts_event.contact_id, event_id: @contacts_event.event_id }
    end

    assert_redirected_to contacts_event_path(assigns(:contacts_event))
  end

  test "should show contacts_event" do
    get :show, id: @contacts_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contacts_event
    assert_response :success
  end

  test "should update contacts_event" do
    patch :update, id: @contacts_event, contacts_event: { contact_id: @contacts_event.contact_id, event_id: @contacts_event.event_id }
    assert_redirected_to contacts_event_path(assigns(:contacts_event))
  end

  test "should destroy contacts_event" do
    assert_difference('ContactsEvent.count', -1) do
      delete :destroy, id: @contacts_event
    end

    assert_redirected_to contacts_events_path
  end
end
