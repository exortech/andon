class JiraProvider < ActiveRecord::Base
	has_one :metric, :as => :provider
end
