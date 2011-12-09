require "reportbuilder"
class PollsController < ApplicationController
  before_filter :authenticate_user!

  def menu
    session[:email] = current_user.email #params[:user][:email]    
  end  
  
  def index
      @report= Poll.all
      @answered = Answers.find_all_by_email( session[:email] )#.collect { |answered| answered.poll_id }
      @pollidarray = []
      @answered.each do |f|
         @pollidarray.push(f.poll_id )
      end
      if @answered != []
         @poll = Poll.where('id NOT IN (?)',@pollidarray)
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
  
  def answeredpolls
      @answered = Answers.find_all_by_email( session[:email] )#.collect { |answered| answered.poll_id }
      @pollidarray = []
      @answered.each do |f|
         @pollidarray.push(f.poll_id )
      end

     @pollidarray.each do |f| 
     @poll = Poll.where('id IN (?)',@pollidarray  )
   end
  end

  def report
      @polls = Poll.all
      rb = ReportBuilder.new 
      section=ReportBuilder::Section.new(:name=>"Section 1")
      table=ReportBuilder::Table.new(:name=>"Table", :header=>%w{question})
      @polls.each do |poll|
      table.row(["#{poll.question}"])
      table.hr
      end
      section.add(table)
      rb.add(section)
      filename = Guid.new
      File.open("#{filename}",'w'){|f| f.write(rb.to_html)} 
      render 'home/josh/pollster/'"#{filename}"
  end
end
