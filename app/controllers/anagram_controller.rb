class AnagramController < ApplicationController
  def check_word
    #Lets create aall the variations of a word and check against the
    # dictionary we already have.
    # We then push all the existing words to a final array
    require 'date'
    @anagrams = session[:anagrams] || []
    starttime = Time.now.to_f
    word = params[:word]
    #Lets create the word variations
    list = create_anagram(word)
    puts "Anagram array : #{list}"
    #Now lets see how many words match
    existing_words = []
    words = Dictionary.get_words()
    puts "How many: #{words.length} "
    list.each do |i|
      #Lets save them for later
      existing_words.push(i) if words[i] == 1
    end
    endtime = Time.now.to_f
    loading = endtime - starttime
    anagram = Hash[];
    anagram['word'] = word
    anagram['time'] = loading
    anagram['datetime'] = Time.now.strftime("%d/%m/%Y %H:%M")
    anagram['struct'] = existing_words
    @anagrams.push(anagram)
    puts "Final array : #{@anagrams}"
    #Save the structure on the session
    session[:anagrams] = @anagrams
    redirect_to root_url
  end

  def create_anagram(word)
    #This takes a word and returns an array with all the combinations
    list = []
    # In Ruby 2.0 @word.chars will return an array, no need for `to_a`.
    # This does exactly what we need
      word.chars.permutation.map(&:join).uniq.each do |anagram|
      list.push(anagram)
    end
    return list
  end
end
