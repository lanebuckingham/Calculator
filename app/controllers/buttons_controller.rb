class ButtonsController < ApplicationController
  before_filter :prepare_session

  def prepare_session
    session[:num] ||= "0"
    session[:stack] ||= []
  end


  def Home
  end

  def Backspace
    session[:num] = session[:num][0..-2]
    Show()
  end

  def CE
    session[:num] = "0"
    Show()
  end

  def C
    session[:num] = "0"
    session[:stack] = []
    Show()
  end

  def MC
    Show()
  end

  def MR
    Show()
  end

  def MS
    Show()
  end

  def MPlus
    Show()
  end

  def One
    session[:num] += "1"
    Show()
  end

  def Two
    session[:num] += "2"
    Show()
  end

  def Three
    session[:num] += "3"
    Show()
  end

  def Four
    session[:num] += "4"
    Show()
  end

  def Five
    session[:num] += "5"
    Show()
  end

  def Six
    session[:num] += "6"
    Show()
  end

  def Seven
    session[:num] += "7"
    Show()
  end

  def Eight
    session[:num] += "8"
    Show()
  end

  def Nine
    session[:num] += "9"
    Show()
  end

  def Zero
    session[:num] += "0"
    Show()
  end

  def PlusMinus
    if session[:num].to_f < 0 
      session[:num] = session[:num][1..-1] 
    else
      session[:num] = "-#{session[:num]}"
    end
    Show()
  end

  def Dot
    session[:num] += '.' if not session[:num].include? '.'
    Show()
  end

  def Divide
    #session[:stack].push session[:num].to_f
    #session[:stack].push :/
    #render "Home"
    Push :/
    Show() 
    session[:num] = ""
  end

  def Multiply
    #session[:stack].push session[:num].to_f
    #session[:stack].push :*
    #render "Home"
    Push :*
    Show() 
    session[:num] = ""
  end

  def Add
    #session[:stack].push session[:num].to_f
    #session[:stack].push :+
    #render "Home"
    Push :+
    Show() 
    session[:num] = ""
  end

  def Subtract
    #session[:stack].push session[:num].to_f
    #session[:stack].push :-
    #render "Home"
    Push :-
    Show() 
    session[:num] = ""
  end

  def Sqrt
    session[:num] = Math.sqrt(session[:num].to_f).to_s
    Show()
  end

  def Percent
    session[:num] = (session[:savedNum] * (session[:num].to_f / 100)).to_s
    Show()
  end

  def OneOver
    session[:num] = (1.0 / session[:num].to_f).to_s
    Show()
  end

  def Equals

    # Evaluate the stack

    
    case session[:stack]
    when :add
      session[:savedNum] += session[:num].to_f
    when :subtract
      session[:savedNum] -= session[:num].to_f
    when :multiply
      session[:savedNum] *= session[:num].to_f
    when :divide
      session[:savedNum] /= session[:num].to_f
    end

    # End operation
    session[:stack] = ""

    # Show the result
    session[:num] = session[:savedNum].to_s

    Show()

    # Reset numbers
    session[:num] = ""
    session[:savedNum] = 0.0

  end


private

  def Push(sym)    
    session[:stack].push session[:num].to_f
    session[:stack].push sym
  end

  def Show
    # Remove leading "0"
    if session[:num].length > 1 && session[:num][0,1] == "0"
      session[:num] = session[:num][1..-1]
    end

    # Remove trailing ".0" if num is an integer
    if session[:num][-2..-1] == ".0"
      session[:num] = session[:num][0..-3]
    end

    # Show currNum
    render "Home"
  end

end
