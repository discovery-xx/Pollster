class AnswersController < ApplicationController
  def create
      @answer = Answers.new
      @answer.option = params[:answers][:option]
      @answer.email =  session[:email]
      @answer.poll_id = session[:pollid] 
      @answer.save
      @poll = Poll.find(session[:pollid] )
      if @answer.option == 1
         @poll.option1count +=1
      elsif @answer.option == 2
         @poll.option2count +=1
      elsif @answer.option == 3
         @poll.option3count +=1
      end 
     @poll.update_attributes :option1count => @poll.option1count, :option2count => @poll.option2count, :option3count => @poll.option3count
     
   end
end
