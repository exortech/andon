class MetricsController < ApplicationController
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @metric_pages, @metrics = paginate :metrics, :per_page => 10
  end

  def show
    @metric = Metric.find(params[:id])
  end

  def new
    @metric = Metric.new
  end

  def create
    @metric = Metric.new(params[:metric])
    if @metric.save
      flash[:notice] = 'Metric was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @metric = Metric.find(params[:id])
  end

  def update
    @metric = Metric.find(params[:id])
    if @metric.update_attributes(params[:metric])
      flash[:notice] = 'Metric was successfully updated.'
      redirect_to :action => 'show', :id => @metric
    else
      render :action => 'edit'
    end
  end

  def destroy
    Metric.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
