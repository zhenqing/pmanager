class Task < ActiveRecord::Base
  extend Enumerize
  extend ActiveModel::Naming
  enumerize :status, in: [:notyet, :inprocess,:finished], default: :notyet
  belongs_to :project

  def slug
      title.downcase.gsub(" ","-")
  end
  def to_param
      "#{id}-#{slug}"
  end
end
