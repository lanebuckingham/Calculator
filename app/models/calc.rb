class Calc
  attr_accessor :input, :stack, :result, :memory

  def initialize
    # init default values
    @input = ""
    @stack = []
    @result = ""
    @memory = ""
  end
  
  def backspace
    # take off the last number inputed
    @input = @input[0..-2]
    @result = @input

    # if input is now blank, make result 0
    if @input == "" then @result = "0" end

    # return result
    @result
  end
  
  def ce
    # clear the current input
    @input = ""
    @result = "0"

    # if the last operation wasn't arithmetic, clear it
    clear_last_op()

    # return result
    @result
  end

  def c
    # clear the current input and all operations
    @input = ""
    @stack = []
    @result = "0"

    # return result
    @result
  end

  def mc
    # clear the memory
    @memory = ""

    # return result
    @result
  end

  def mr
    # if there is a result stored in memory
    if @memory != ""

      # recall the result
      @result = @memory
      @input = @memory.to_s
    end

    # return result
    @result
  end

  def ms
    # store the current result in memory
    @memory = @result.to_f

    # clear input
    @input = ""

    # return result
    @result
  end

  def m_plus
    # if there is a result stored in memory
    if @memory != ""

      # add the current result to it
      @memory += @result.to_f
    end

    # return result
    @result
  end

  def m_minus
    # if there is a result stored in memory
    if @memory != ""

      # subtract the current result from it
      @memory -= @result.to_f
    end

    # return result
    @result
  end
  
  def input num
    # if num is a number
    if numeric? num
        
      # append number to the input
      @input += num.to_s
      @result = @input

      # if the last operation wasn't arithmetic, clear it
      clear_last_op()
    end

    # return result
    @result
  end
  
  def dot
    # append a dot to the input if there isn't one already
    @input += '.' if !(@input.include? '.')

    # return result
    @result
  end

  def plus_minus    
    # get the latest input or result
    a = get_input_or_result
  
    # flip its sign
    a *= -1

    # update input and result
    @result = a
    @input = a.to_s if @input != ""
    
    # if there's at least one operation on the stack 
    if @stack.count > 0

      # if the last one isn't arithmetic
      if !last_op_arithmetic?

        # flip its sign, too
        @stack[-1] = "-#{@stack[-1]}"
      end
    end

    # return result
    @result
  end
  
  def square_root
    # get the latest input or result
    a = get_input_or_result

    # if it is positive
    if a > 0

      # take its square root
      b = sqrt a

      # update result, clear input
      @result = b
      @input = ""

      # if there's nothing on the stack
      # or the last operation is arithmetic
      if @stack.count == 0 || last_op_arithmetic?

        # put it on the stack
        @stack.push "sqrt(#{a})"

      #else
      else

        # update the last operation on the stack
        @stack[-1] = "sqrt(#{@stack[-1]})"
      end
    end

    # return result
    @result
  end

  def reciprocal
    # get the latest input or result
    a = get_input_or_result

    # get its reciprocal
    b = 1 / a

    # update result, clear input
    @result = b
    @input = ""

    # if there's nothing on the stack
    # or the last operation is arithmetic
    if @stack.count == 0 || last_op_arithmetic?

      # put it on the stack
      @stack.push "(1 / #{a})"

    #else
    else

      # update the last operation on the stack
      @stack[-1] = "(1 / #{@stack[-1]})"
    end

    # return result
    @result
  end

  def percent
    # get the latest input or result
    a = get_input_or_result

    # if there are operations on the stack 
    if @stack.count > 1

      # if the last one isn't arithmetic
      if !last_op_arithmetic?

        #remove it
        @stack.pop
      end

      # evaluate the first part of the stack
      b = evaluate(@stack)

      # get the percentage
      a = a / 100

      # apply percentage 
      b *= a

      # put it on the stack
      @stack.push b

      # update result, clear input
      @result = b
      @input = ""
    end

    # return result
    @result
  end

  def plus
    operation "+"
  end

  def minus
    operation "-"
  end

  def divide
    operation "/"
  end

  def multiply
    operation "*"
  end

  def equals
    # if there is nothing on the stack
    # or the last operation is arithmetic
    if @stack.count == 0 || 
    last_op_arithmetic?

      # get the latest input or result
      a = get_input_or_result

      # put it on the stack
      @stack.push a
    end

    # eval stack to get result, clear input, clear stack
    @result = evaluate @stack
    @input = ""
    @stack = []

    # return result
    @result
  end


private

  def numeric? object
    # get whether object can be a float
    true if Float(object) rescue false
  end

  def get_input_or_result
      # get the latest input or result
    return (@input != "" ? @input : @result).to_f
  end

  def last_op_arithmetic?
    # get whether the last operation in the stack is arithmetic
    return (['+', '-', '*', '/'].include? @stack[-1])
  end

  def clear_last_op
    # if there's at least one operation on the stack
    # and the last one isn't arithmetic
    if @stack.count > 0 && 
    !last_op_arithmetic?

      # clear it
      @stack.pop
    end
  end

  def operation op
    # if there is nothing on the stack
    if @stack.count == 0 

      # get the latest input or result
      a = get_input_or_result

      # put it on the stack
      @stack.push a

      # put the operation on the stack
      @stack.push op

    # else if there's at least one operation on the stack
    # and the last one is arithmetic
    elsif @stack.count > 0 && last_op_arithmetic?

      # if there is input
      if @input != ""

        # put it on the stack
        @stack.push @input.to_f

        # put this operation on the stack
        @stack.push op

      # else
      else

        # change the last operation to this operation
        @stack[-1] = op
      end

    # else
    else

      # put the operation on the stack
      @stack.push op
    end

    # eval stack to get result, clear input
    @result = evaluate @stack
    @input = ""

    # return result
    @result
  end

  def evaluate stack
    # duplicate stack to avoid changing it during eval
    s = stack.dup

    # if there's at least one operation on the stack 
    # and the last one is arithmetic
    if s.count > 0 && last_op_arithmetic?

      # remove it
      s.pop
    end

    # stringify stack and return its evaluation
    # this uses Ruby's own interpreter 'eval' to perform the calculations
    # so really this is not a calculator, just a huge wrapper for Ruby's 'eval' :)
    # if errors, return 0
    begin
      eval s.join ' '
    rescue      
      0
    end
  end

  def sqrt x
    # alias for:
    Math.sqrt x
  end

end
