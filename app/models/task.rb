class Task < ActiveRecord::Base
  extend Enumerize
  extend ActiveModel::Naming
  enumerize :status, in: {notstart:1,inprocess:2,finished:3}
  belongs_to :project
  include RankedModel
  ranks :row_order
scope :finished, ->{where(finished:true)}
scope :unfinished, ->{where(finished:false)}

  def slug
      title.downcase.gsub(" ","-")
  end
  def to_param
      "#{id}-#{slug}"
  end
end
