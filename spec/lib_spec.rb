require 'rspec'
require 'dir'
require 'spec_helper'

require File.dirname(__FILE__) + '..' + '/youtube_dlhelper/checker'
require File.dirname(__FILE__) + '..' + '/youtube_dlhelper/version'
require File.dirname(__FILE__) + '..' + '/youtube_dlhelper/downloader'
require File.dirname(__FILE__) + '..' + '/youtube_dlhelper/import_config'
require File.dirname(__FILE__) + '..' + '/youtube_dlhelper/ripper'

tempfile = 'Crystallize_-_Lindsey_Stirling_Dubstep_Violin_Original_Song'
ffmpeg_binary = '/usr/local/bin/ffmpeg'

describe 'Checker' do
  describe '.external_url_is_valid?' do
    it 'get an url, test it and give back when valid' do
      # rubocop:disable Metrics/LineLength
      url = Checker.external_url_is_valid?('http://www.youtube.com/watch?v=aHjpOzsQ9YI')
      expect(url).equal? 'true'
    end
  end
end

describe 'Import' do
  describe '.import_config' do
    it 'reads in some variables and fill them localy' do
      music_dir, ogg_file_accept, ffmpeg_binary = Import.import_config
      expect(music_dir).equal? 'Musik'
      expect(ogg_file_accept).equal? 'true'
      expect(ffmpeg_binary).equal? '/usr/local/bin/ffmpeg'
    end
  end
end

describe 'Downoader' do
  describe '.get' do
    it 'downloads a file to youtube' do
      Downloader.get('http://www.youtube.com/watch?v=aHjpOzsQ9YI')
      expect(File.exists?("#{tempfile}.m4a")).equal? 'true'
    end
  end
end

describe 'Ripper' do
  describe '.rip_prepare' do
    context 'With ogg_file_accept' do
      ogg_file_accept = 'true'
      it 'should not convert a file from youtube' do
        Ripper.rip_prepare(tempfile, ogg_file_accept, ffmpeg_binary)
        expect(File.exists?("#{tempfile}.ogg")).equal? 'true'
      end
    end

    context 'Without ogg_file_accept' do
      ogg_file_accept = 'true'
      it 'should convert a file from youtube' do
        Ripper.rip_prepare(tempfile, ogg_file_accept, ffmpeg_binary)
        expect(File.exists?("#{tempfile}.mp3")).equal? 'true'
      end
    end
  end
end

describe 'Checker' do
  describe '.cleanup' do
    it 'Cleansup all downloaded and generated files' do
      Checker.cleanup(tempfile)
      expect(File.exist?("#{tempfile}.mp4")).equal? 'false'
      expect(File.exist?("#{tempfile}.m4a")).equal? 'false'
      File.delete("#{tempfile}.mp3") if File.exist?("#{tempfile}.mp3")
      File.delete("#{tempfile}.ogg") if File.exist?("#{tempfile}.ogg")
    end
  end
end