class Dictionary < ActiveRecord::Base
    attr_accessor :upload
    @words = []
  def self.parse_file(upload)
    #Lets start the timer to see how long it takes to do this
    #TODO Check if we cant' read the file i.e. not a txt file
    starttime = Time.now.to_f
    @file_name = upload['datafile'].original_filename  if  (upload['datafile'] !='')
    dictionary = upload['datafile'].read

    arr = dictionary.split(' ')
    @words = Hash[arr.map{|x| [x, 1]}]
    # @words.each do |key, value|
    #    puts "key: #{key}, value: #{value}"
    #  end
    endtime = Time.now.to_f
    @loading = endtime - starttime
    #puts "Time it took: #{@loading} "
  end

  def self.file_name
    @file_name
  end

  def self.loading_time
    @loading
  end

  def self.get_words
    #puts "Sending this: #{@words.length} "
    @words
  end

end
