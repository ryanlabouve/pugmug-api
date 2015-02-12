require 'test_helper'

class PugsControllerTest < ActionController::TestCase
  setup do
    @pug = pugs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pugs)
  end

  test "should create pug" do
    assert_difference('Pug.count') do
      post :create, pug: { self_text: @pug.self_text, title: @pug.title, url: @pug.url }
    end

    assert_response 201
  end

  test "should show pug" do
    get :show, id: @pug
    assert_response :success
  end

  test "should update pug" do
    put :update, id: @pug, pug: { self_text: @pug.self_text, title: @pug.title, url: @pug.url }
    assert_response 204
  end

  test "should destroy pug" do
    assert_difference('Pug.count', -1) do
      delete :destroy, id: @pug
    end

    assert_response 204
  end
end
