class Task < ActiveRecord::Base
  belongs_to :project
  def slug
      title.downcase.gsub(" ","-")
  end
  def to_param
      "#{id}-#{slug}"
  end
end
