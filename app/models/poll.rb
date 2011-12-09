class Poll < ActiveRecord::Base
   
  has_many :answers, :dependent => :destroy
  validates_presence_of :question, :option1, :option2, :option3  
end
