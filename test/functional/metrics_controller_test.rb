require File.dirname(__FILE__) + '/../test_helper'
require 'metrics_controller'

# Re-raise errors caught by the controller.
class MetricsController; def rescue_action(e) raise e end; end

class MetricsControllerTest < Test::Unit::TestCase
  fixtures :metrics

  def setup
    @controller = MetricsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @first_id = metrics(:one).id
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

    assert_not_nil assigns(:metrics)
  end

  def test_show
    get :show, :id => @first_id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:metric)
    assert assigns(:metric).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:metric)
  end

  def test_create
    num_metrics = Metric.count

    post :create, :metric => { }

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_metrics + 1, Metric.count
  end

  def test_edit
    get :edit, :id => @first_id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:metric)
    assert assigns(:metric).valid?
  end

  def test_update
    post :update, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => @first_id
  end

  def test_destroy
    assert_nothing_raised {
      Metric.find(@first_id)
    }

    post :destroy, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Metric.find(@first_id)
    }
  end
end
