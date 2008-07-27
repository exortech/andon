require File.dirname(__FILE__) + '/../test_helper'
require 'dashboards_controller'

# Re-raise errors caught by the controller.
class DashboardsController; def rescue_action(e) raise e end; end

class DashboardsControllerTest < Test::Unit::TestCase
  fixtures :dashboards

  def setup
    @controller = DashboardsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @first_id = dashboards(:default).id
  end

  def test_index
    get :index
    assert_response :success
    assert_template 'list'
  end

  def test_list
    get :list

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:dashboards)
  end

  def test_show
    get :show, :id => @first_id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:dashboard)
    assert assigns(:dashboard).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:dashboard)
  end

  def test_create
    num_dashboards = Dashboard.count

    post :create, :dashboard => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_dashboards + 1, Dashboard.count
  end

  def test_edit
    get :edit, :id => @first_id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:dashboard)
    assert assigns(:dashboard).valid?
  end

  def test_update
    post :update, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => @first_id
  end

  def test_destroy
    assert_nothing_raised {
      Dashboard.find(@first_id)
    }

    post :destroy, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Dashboard.find(@first_id)
    }
  end
end
