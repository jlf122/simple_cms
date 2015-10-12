class DemoController < ApplicationController
  
layout 'application'
   #File used to test demo

  def index
  	#render(:template => 'demo/hello')
  end

  def hello
  	#render('index')
  	@array = [0,1,2,3,4,5,6,7,8,9,0]
  	@id = params['id'].to_i
  	@page = params[:page].to_i
  end

  def other_hello
  	redirect_to(:controller => 'demo', :action => 'index')
  end

  def center
  	redirect_to("http://crppt.polisci.txstate.edu")
  end

  def text_helpers
  end

  def escape_output
  end

  def make_error
    # My guesses for the 3 most common errors:
    #render(:text => "test" # syntax error, unexpected X, expecting Y
    #render(:text => @something.upcase) # undefined method on nil
    #render(:text => "1" + 1) # can't convert type
  end


end
