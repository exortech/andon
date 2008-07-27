require File.dirname(__FILE__) + '/../test_helper'

class CruiseControlProviderTest < Test::Unit::TestCase
  fixtures :dashboards

  def test_correctly_manages_association_between_metric_and_provider
	  server = CruiseControlServer.create(:url => "http://ccnetlive.thoughtworks.com/ccnet/XmlStatusReport.aspx")
	  ccnetliveProvider = CruiseControlProvider.new(:project => 'CCNet', :server => server)
	  m = Metric.new :name => "CCNet Build", :provider => ccnetliveProvider
	  m.dashboard = dashboards(:default)
	  m.save!
  end
end
