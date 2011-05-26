class Poll < ActiveRecord::Base
   has_many :answers, :dependent => :destroy
end
