require 'rspec'
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'youtube_dlhelper/libs'

#set :environment, :test

#describe 'Valid URL Checker' do
#  it 'should get an url, test it and five back a true' do
#    YoutubeDlhelperLibs::Checker.valid_url?('http://www.youtube.com/watch?v=aHjpOzsQ9YI')
#  end
#end

#describe 'Check Target' do
#  it 'should return a string with the right dir'
#    YoutubeDlhelperLibs::Checker.check_target
#    if $folder.equal? 'Test/Youtube-Music'
#      return true
#    else
#      return false
#    end
#end