require 'rspec'
require File.join(File.dirname(__FILE__), '..', '/test/spec_helper')

# rubocop:disable Metrics/LineLength
require File.join(File.dirname(__FILE__), '..', '/lib/youtube_dlhelper/version')
require File.join(File.dirname(__FILE__), '..', '/lib/youtube_dlhelper/checker')
require File.join(File.dirname(__FILE__), '..', '/lib/youtube_dlhelper/downloader')
require File.join(File.dirname(__FILE__), '..', '/lib/youtube_dlhelper/import_config')
require File.join(File.dirname(__FILE__), '..', '/lib/youtube_dlhelper/ripper')
require File.join(File.dirname(__FILE__), '..', '/lib/youtube_dlhelper/notifier')

tempfile = 'Crystallize_-_Lindsey_Stirling_Dubstep_Violin_Original_Song'
tempfile1 = 'Crystallize - Lindsey Stirling (Dubstep Violin Original Song)'
ffmpeg_binary = '/usr/local/bin/ffmpeg'

describe 'Checker' do
  describe '.external_url_is_valid?' do

    context 'using http url' do
      it 'get an url, test it and give back when valid' do
        # rubocop:disable Metrics/LineLength
        url = Checker.external_url_is_valid?('http://www.youtube.com/watch?v=aHjpOzsQ9YI')
        expect(url).equal? 'true'
      end
    end

    context 'using https url' do
      it 'get the url, test and give back when valid' do
        url = Checker.external_url_is_valid?('https://www.youtube.com/watch?v=aHjpOzsQ9YI')
        expect(url).equal? 'true'
      end
    end
  end

  describe '.which_decoder?' do
    it 'checks what decoder can be used' do
      ffmpeg_binary = Checker.which_decoder?
      expect(ffmpeg_binary).equal? '/usr/local/bin/ffmpeg' || '/usr/bin/avconv'
    end
  end
end

# describe 'Import' do
#   describe '.import_config' do
#     it 'reads in some variables and fill them localy' do
#       music_dir, ogg_file_accept = Import.import_config
#       expect(music_dir).equal? 'Musik'
#       expect(ogg_file_accept).equal? 'true'
#     end
#   end
# end

describe 'Downoader' do
  describe '.get' do
    it 'downloads a file from youtube' do
      Downloader.get('http://www.youtube.com/watch?v=aHjpOzsQ9YI')
      expect(File.exist?("#{tempfile}.m4a")).equal? 'true'
    end
  end
end

describe 'Ripper' do
  describe '.rip_prepare' do
    context 'With ogg_file_accept' do
      ogg_file_accept = 'true'
      it 'should not convert a file from youtube' do
        Ripper.rip_prepare(tempfile, ogg_file_accept, ffmpeg_binary)
        expect(File.exist?("#{tempfile}.ogg")).equal? 'true'
      end
    end

    context 'Without ogg_file_accept' do
      ogg_file_accept = 'false'
      it 'should convert a file from youtube' do
        Ripper.rip_prepare(tempfile, ogg_file_accept, ffmpeg_binary)
        expect(File.exist?("#{tempfile}.mp3")).equal? 'true'
      end
    end
  end
end

describe 'Checker' do
  describe '.cleanup' do
    it 'Cleansup all downloaded and generated files' do
      Checker.cleanup(tempfile, tempfile1)
      expect(File.exist?("#{tempfile}.mp4")).equal? 'false'
      expect(File.exist?("#{tempfile}.m4a")).equal? 'false'
      File.delete("#{tempfile1}.mp4") if File.exist?("#{tempfile1}.mp4")
      File.delete("#{tempfile}.mp3") if File.exist?("#{tempfile}.mp3")
      File.delete("#{tempfile}.ogg") if File.exist?("#{tempfile}.ogg")
    end
  end
end

describe 'Notifier' do
  describe '.run' do
    it 'Gives a Notify' do
      Notifier.run
    end
  end
end
