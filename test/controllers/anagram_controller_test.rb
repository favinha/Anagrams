require 'test_helper'

class AnagramControllerTest < ActionDispatch::IntegrationTest
  #We need to test several words:
  # 1 - non existing word
  # 2 - existing word. We then check against the returning structure. No point in checking the time it takes
  # 3 - Check if we get redirected to the root_url
  
end
