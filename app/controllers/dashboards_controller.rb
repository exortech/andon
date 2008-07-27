class DashboardsController < ApplicationController
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @dashboard_pages, @dashboards = paginate :dashboards, :per_page => 10
  end

  def show
      @dashboard = Dashboard.find(params[:id])
  end

  def new
    @dashboard = Dashboard.new
  end

  def create
    @dashboard = Dashboard.new(params[:dashboard])
    if @dashboard.save
      flash[:notice] = 'Dashboard was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @dashboard = Dashboard.find(params[:id])
  end

  def update
    @dashboard = Dashboard.find(params[:id])
    if @dashboard.update_attributes(params[:dashboard])
      flash[:notice] = 'Dashboard was successfully updated.'
      redirect_to :action => 'show', :id => @dashboard
    else
      render :action => 'edit'
    end
  end

  def destroy
    Dashboard.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
