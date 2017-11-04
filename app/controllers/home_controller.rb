class HomeController < ApplicationController
  def index
    @loading_time = ''
    @file_name = ''
    if Dictionary.get_words().empty?
      puts "======> EMPTY <======="
      #Lets reset the session every time we upload a new file
      reset_session
    else
      #return the time rounded 
      @loading_time = (Dictionary.loading_time() *100 ).round(3)
      @file_name = Dictionary.file_name()
    end
  end

  def about
  end

end
