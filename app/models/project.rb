class Project < ActiveRecord::Base
    has_many :tasks, dependent: :destroy
    accepts_nested_attributes_for :tasks
    def slug
        title.downcase.gsub(" ","-")
    end
    def to_param
        "#{id}-#{slug}"
    end
end
