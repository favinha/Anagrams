require 'test_helper'

class UploadControllerTest < ActionDispatch::IntegrationTest
  test "file upload" do
    #Upload a file and see if we get redirectd to the root page
    test_file = fixture_path + "files/words.txt"
    @file = Rack::Test::UploadedFile.new(test_file, "text/plain")
    post '/upload', :params => { :datafile => @file }
    puts request.url
    # assert desired results

    assert_response 200
    assert_response :success
  end
end
