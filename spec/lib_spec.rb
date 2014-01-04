require 'rspec'
require 'dir'
require 'fileutils2'
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'youtube_dlhelper/libs'
@tempfile = 'Crystallize___Lindsey_Stirling__Dubstep_Violin_Original_Song_'

#set :environment, :test

describe 'Valid URL Checker' do
  it 'should get an url, test it and five back a true' do
    puts 'Entering Check: Valid URL Checker'
    YoutubeDlhelperLibs::Checker.valid_url?('http://www.youtube.com/watch?v=aHjpOzsQ9YI')
    puts 'Test passed...'
  end
end

describe 'Valid URL Checker Fail' do
  it 'should fail by using wrong entrys'
  puts 'Entering Check: Valid URL Checker Fail'
  YoutubeDlhelperLibs::Checker.valid_url?('heroin.doc')
  puts 'Test passed...'
end

describe 'Config Import Checker' do
  it 'should fill musicdir to $music_dir' do
    puts 'Entering Check: Config Import Checker'
    YoutubeDlhelperLibs::Import.import_config
    $music_dir.equal? '/home/sascha/Musik'
    puts 'Test passed ...'
  end
end

describe 'Download Checker' do
  it 'shoud download a file from Youtube' do
      puts 'Entering Check: Download Checker'
      YoutubeDlhelperLibs::Downloader.get('http://www.youtube.com/watch?v=aHjpOzsQ9YI')
      File.exists?("#{@tempfile}.mp4")
      puts 'Test passed'

  end
end

describe 'Transcoding Checker' do
  it 'should converts a file from Youtube' do
    puts 'Entering Test: Transcoding Checker'
    @tempfile = 'Crystallize___Lindsey_Stirling__Dubstep_Violin_Original_Song_'
    YoutubeDlhelperLibs::Ripper.rip("#{@tempfile}")
    File.exists?("#{@tempfile}.mp3")
    puts 'Test passed...'
  end
end

describe 'Cleanup Routine' do
  it 'Should cleanup all downloaded and generated files' do
    require 'fileutils2'
    @tempfile = 'Crystallize___Lindsey_Stirling__Dubstep_Violin_Original_Song_'
    File.delete("#{@tempfile}.mp4")
    File.delete("#{@tempfile}.m4a")
    File.delete("#{@tempfile}.mp3")
  end
end
