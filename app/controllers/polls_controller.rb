class PollsController < ApplicationController
  def input
  #session[:email] = params
  #redirect_to :action => 'menu' 
  end

  def menu
     session[:email] = params[:email][:email]   
  end  
  
  def index
      @answered = Answers.find_all_by_email( session[:email] )#.collect { |answered| answered.poll_id }
      pollidarray = []
      @answered.each do |f|
         pollidarray.push(f.poll_id )
      end
      if @answered != []
         @poll = Poll.where('id NOT IN (?)',pollidarray)
      else
         @poll = Poll.all
      end  
  end

  def new
      @poll = Poll.new  
  end
  
  def create
     @poll = Poll.new(params[:poll])
     if @poll.save
        redirect_to :action => 'index'
     else
        redirect_to :back
     end
  end
 
  def show
     @poll = Poll.find(params[:id])
     session[:pollid] = params[:id]
     @answers = Answers.new
  end
  
  def logout
    #if params[:id] == "logoput"
    session[:email]= nil
    redirect_to :action => 'input'
    #end
  end
end
