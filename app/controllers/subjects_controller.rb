class SubjectsController < ApplicationController
  
 layout "admin"

before_action :confirm_logged_in

  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new({:name => "Default"})
    @subject_count = Subject.count + 1
  end

  def create
    #Instantiate a new object using parameters
    @subject = Subject.new(subject_params)
    # Save the project
    if @subject.save
    # If save succeds, redirect to index actions
    flash[:notice] = "Subject created successfully!"
    redirect_to(:action => 'index')
    else
    #If save fails, resisplay the form so user can fix problems
    @subject_count = Subject.count + 1
    render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count
  end

  def update
    # Find an existing object using parameters
    @subject = Subject.find(params[:id])
    # Update the project
    if @subject.update_attributes(subject_params)
    # If update succeds, redirect to show page
    flash[:notice] = "Subject updated successfully!"
    redirect_to(:action => 'show', :id => @subject.id)
    else
    #If save fails, resisplay the form so user can fix problems
    @subject_count = Subject.count
    render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    subject = Subject.find(params[:id]).destroy
    flash[:notice] = "Subject '#{subject.name}' deleted successfully!"
    redirect_to(:action => 'index')
  end

  def page_home
    redirect_to("http://localhost:3000/pages/index")
  end

  def admin_home
    redirect_to("http://localhost:3000/access/index")
  end

  def login
    #login form
  end

  def logout
    # mark user as logged out
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = "Logged out"
    redirect_to(:action => "login")
  end

  private

  def subject_params
    # same as using "params[:subject]", except that it:
    # - raises an error if :subject is not present
    # - allows listed attributes to be mass-assigned
    params.require(:subject).permit(:name, :position, :visible, :created_at)
  end
    
  

end
