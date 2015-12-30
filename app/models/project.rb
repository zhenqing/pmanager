class Project < ActiveRecord::Base
    has_many :tasks
    def slug
        title.downcase.gsub(" ","-")
    end
    def to_param
        "#{id}-#{slug}"
    end
end
