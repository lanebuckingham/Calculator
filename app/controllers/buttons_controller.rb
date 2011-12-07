class ButtonsController < ApplicationController
  before_filter :prepare_session

  def prepare_session
    # initialize session variables
    session[:calc] ||= Calc.new
  end
  
  def home
    # show the default view
  end

  def backspace
    session[:calc].backspace
    show()
  end
  
  def ce
    session[:calc].ce
    show()
  end

  def c
    session[:calc].c  
    show()
  end

  def mc
    session[:calc].mc
    show()
  end

  def mr
    session[:calc].mr
    show()
  end

  def ms
    session[:calc].ms
    show()
  end

  def m_plus
    session[:calc].m_plus
    show()
  end

  def m_minus
    session[:calc].m_minus
    show()
  end
  
  def input    
    session[:calc].input params[:num]
    show()
  end
  
  def dot
    session[:calc].dot
    show()
  end

  def plus_minus    
    session[:calc].plus_minus
    show()
  end
  
  def square_root
    session[:calc].square_root
    show()
  end

  def reciprocal
    session[:calc].reciprocal
    show()
  end

  def percent
    session[:calc].percent
    show()
  end

  def plus
    session[:calc].plus
    show()
  end

  def minus
    session[:calc].minus
    show()
  end

  def divide
    session[:calc].divide
    show()
  end

  def multiply
    session[:calc].multiply
    show()
  end

  def equals
    session[:calc].equals
    show()
  end


private

  def show
    # show the default view
    render "Home"
  end

end
