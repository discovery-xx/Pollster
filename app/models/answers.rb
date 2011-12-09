class Answers < ActiveRecord::Base
   belongs_to :poll    
   belongs_to :user
   validates :option4, :presence => true
   validates :answer6, :presence => true
end
