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
    files = Dir.glob('*.m*')
    puts files
    @tempfile = 'Crystallize___Lindsey_Stirling__Dubstep_Violin_Original_Song_'
      File.exists?("#{@tempfile}.m4a").should be_true
      File.exists?("#{@tempfile}.mp4").should be_true

  end
end

describe 'Transcoding Checker' do
  it 'should converts a file from Youtube' do
    @tempfile = 'Crystallize___Lindsey_Stirling__Dubstep_Violin_Original_Song_'
    File.exists?("#{@tempfile}.m4a").should be_true
    Ripper.rip("#{@tempfile}")
    files = Dir.glob('*.m*')
    puts files
    File.exists?("#{@tempfile}.mp3").should be_true
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
    File.delete("#{@tempfile}.mp4")
    File.delete("#{@tempfile}.m4a")
    File.delete("#{@tempfile}.mp3")
  end
end