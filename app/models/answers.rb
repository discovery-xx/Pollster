class Answers < ActiveRecord::Base
   belongs_to :poll    
   belongs_to :user
   validates :flag, :presence => true
   validates :fuzz, :presence => true
end
