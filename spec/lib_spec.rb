require 'rspec'
require 'dir'
require 'fileutils2'
require File.dirname(__FILE__) + '/spec_helper'
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'youtube_dlhelper/libs'
require 'youtube_dlhelper/version'
@tempfile = 'Crystallize___Lindsey_Stirling__Dubstep_Violin_Original_Song_'

describe 'Valid URL Checker' do
  it 'should get an url, test it and five back a true' do
    puts '####################################################################################'
    puts '# Starting a new Test ...                                                          #'
    puts '####################################################################################'

    puts '####################################################################################'
    puts '# Starting Valid URL Checker...                                                    #'
    puts '####################################################################################'
    puts 'Entering Check: Valid URL Checker'
    YoutubeDlhelperLibs::Checker.valid_url?('http://www.youtube.com/watch?v=aHjpOzsQ9YI')
    puts 'Test passed...'
  end
end

describe 'Config Import Checker' do
  it 'should fill musicdir to $music_dir' do
    puts '####################################################################################'
    puts '# Starting Config Import Checker ...                                               #'
    puts '####################################################################################'
    puts 'Entering Check: Config Import Checker'
    YoutubeDlhelperLibs::Import.import_config
    $music_dir.equal? '/home/sascha/Musik'
    puts 'Test passed...'
  end
end

describe 'Download Checker' do
  it 'shoud download a file from Youtube' do
    puts '####################################################################################'
    puts '# Starting Download Checker ...                                                    #'
    puts '####################################################################################'
    puts 'Entering Check: Download Checker'
    YoutubeDlhelperLibs::Downloader.get('http://www.youtube.com/watch?v=aHjpOzsQ9YI')
    @tempfile = 'Crystallize___Lindsey_Stirling__Dubstep_Violin_Original_Song_'
      if File.exists?("#{@tempfile}.m4a")
        puts "Found Audiofile: #{@tempfile}.m4a"
      else
        puts "Audiofile not found: #{@tempfile}.m4a"
      end
      if File.exists?("#{@tempfile}.mp4")
        puts "Found Videoofile: #{@tempfile}.mp4"
      else
        puts "Videofile not found: #{@tempfile}.mp4"
      end
      puts 'Test passed...'
  end
end

describe 'Transcoding Checker' do
  it 'should converts a file from Youtube' do
    puts '####################################################################################'
    puts '# Starting Transcoding Checker ...                                                 #'
    puts '####################################################################################'
    puts 'Entering Check: Transcoding Checker'
    @tempfile = 'Crystallize___Lindsey_Stirling__Dubstep_Violin_Original_Song_'
    if File.exists?("#{@tempfile}.m4a")
      puts "Found Audiofile: #{@tempfile}.m4a"
    else
      puts "Audiofile not found: #{@tempfile}.m4a"
    end
    YoutubeDlhelperLibs::Ripper.rip("#{@tempfile}")
    if File.exists?("#{@tempfile}.mp3")
      puts "Found Audiofile: #{@tempfile}.mp3"
    else
      puts "Audiofile not found: #{@tempfile}.mp3"
    end
    puts 'Test passed...'
  end
end

describe 'Get Filename Checker' do
  it 'should print out the filename without extension' do
    puts '####################################################################################'
    puts '# Starting Get Filename Checker ...                                                #'
    puts '####################################################################################'
    puts 'Entering Check: Get Filename'
    YoutubeDlhelperLibs::FileHelper.get_filename
    $filename.equal? @tempfile
  end
end

describe 'Cleanup Routine' do
  it 'Should cleanup all downloaded and generated files' do
    puts '####################################################################################'
    puts '# Starting Cleanup Routine ...                                                     #'
    puts '####################################################################################'
    puts 'Entering Check: Cleanup Runtime'
    require 'fileutils2'
    @tempfile = 'Crystallize___Lindsey_Stirling__Dubstep_Violin_Original_Song_'
    File.delete("#{@tempfile}.mp4")
    File.delete("#{@tempfile}.m4a")
    File.delete("#{@tempfile}.mp3")
    puts 'Test passed...'
    puts
    puts
    puts
  end
end