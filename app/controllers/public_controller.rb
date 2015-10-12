class PublicController < ApplicationController
  
  layout 'public'

  before_action :setup_navigation

  def idex
  	# intro text
  end

  def show
  	@page = Page.where(:permalink => params[:permalink], :visible => true).first
  	if @page.nil?
  		redirect_to(:action => 'index')
  	else
  		# display the page content using show.html.erb
    end
  end

  def login_page
    redirect_to("http://localhost:3000/access/login")
  end

  private

  def setup_navigation
    @subjects = Subject.visible.sorted
  end

end
