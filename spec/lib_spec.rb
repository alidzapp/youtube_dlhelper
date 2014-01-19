require 'rspec'
require 'dir'
require 'fileutils2'
require File.dirname(__FILE__) + '/spec_helper'
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'youtube_dlhelper/checker'
require 'youtube_dlhelper/version'
require 'youtube_dlhelper/downloader'
require 'youtube_dlhelper/filehelper'
require 'youtube_dlhelper/import_config'
require 'youtube_dlhelper/ripper'
require 'youtube_dlhelper/usage'
@tempfile = 'Crystallize___Lindsey_Stirling__Dubstep_Violin_Original_Song_'

describe 'Valid URL Checker' do
  it 'should get an url, test it and five back a true' do
    Checker.external_url_is_valid?('http://www.youtube.com/watch?v=aHjpOzsQ9YI')
  end
end

describe 'Config Import Checker' do
  it 'should fill musicdir to $music_dir' do
    Import.import_config
    $music_dir.equal? '/home/sascha/Musik'
  end
end

describe 'Download Checker' do
  it 'shoud download a file from Youtube' do
    Downloader.get('http://www.youtube.com/watch?v=aHjpOzsQ9YI')
    @tempfile = 'Crystallize___Lindsey_Stirling__Dubstep_Violin_Original_Song_'
    File.exists?("#{@tempfile}.ogg") or File.exists?("#{@tempfile}.m4a")
  end
end

describe 'Transcoding Checker' do
  it 'should converts a file from Youtube' do
    @tempfile = 'Crystallize___Lindsey_Stirling__Dubstep_Violin_Original_Song_'
    #Ripper.rip("#{@tempfile}")
    Ripper.rip_prepare
    File.exists?("#{@tempfile}.mp3")
  end
end

describe 'Get final filename' do
  it 'should get the name of the final file' do
    FileHelper.get_final_file
    puts $extension
  end
end

describe 'Get Filename Checker' do
  it 'should print out the filename without extension' do
    FileHelper.get_filename
    $filename.should.equal? @tempfile
  end
end

describe 'Cleanup Routine' do
  it 'Should cleanup all downloaded and generated files' do
    @tempfile = 'Crystallize___Lindsey_Stirling__Dubstep_Violin_Original_Song_'
    Checker.cleanup
    File.exists?("#{@tempfile}.mp4").should_not be_true
    File.exists?("#{@tempfile}.m4a").should_not be_true
    if File.exists?("#{@tempfile}.mp3")
      File.delete("#{@tempfile}.mp3")
    end
    if File.exists?("#{@tempfile}.ogg")
      File.delete("#{@tempfile}.ogg")
    end
  end
end

describe 'Print Usage Info' do
  it 'Should print out the Usage Info for Users' do
    SCRIPTVERSION = YoutubeDlhelperVersion::Version::STRING
    MY_NAME = 'youtube_dlhelper.rb'
    Usage.print_usage
  end
end
