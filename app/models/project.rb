class Project < ActiveRecord::Base
    has_many :tasks, dependent: :destroy
    include RankedModel
    ranks :row_order
    accepts_nested_attributes_for :tasks,
                                 reject_if: proc{|attributes| attributes['title'].blank?},
                                 allow_destroy: true
    scope :finished, ->{where(finished:true)}
    scope :unfinished, ->{where(finished:false)}
    scope :display, ->{where(display:true)}                          
    def slug
        title.downcase.gsub(" ","-")
    end
    def to_param
        "#{id}-#{slug}"
    end
end
