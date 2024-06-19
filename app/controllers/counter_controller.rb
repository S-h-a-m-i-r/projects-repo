def index
end

def add 
    if session[:count] > 0
      session[:count] += 1
    end
  
    @count = session[:count]
  end

  def remove
    if session[:count] > 0
      session[:count] -= 1
    end
  
    @count = session[:count]
  end

  def set_count
    session[:count] = 0  
  end
