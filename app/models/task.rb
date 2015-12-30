class Task < ActiveRecord::Base
    acts_as_nested_set
    belongs_to :project
end
