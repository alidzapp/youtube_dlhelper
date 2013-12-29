# Youtube Converter for Ruby
# Description: Downloads a file from a YT URL transcodes them to MP3 and places it into a choosen folder
# Written by: Sascha Manns <Sascha.Manns@directbox.com>
# Class: YoutubeDlhelperLibs
# Work: This file contains some standard methods for YoutubeDlhelper
# Published under: See LICENSE file

require 'parseconfig'

class YoutubeDlhelperLibs
  module Checker
    def self.check_arguments
      if ARGV.length == 0
        puts "Script: #{my_name} Version: #{scriptversion}"
        puts 'Copyright (C) 2013 Sascha Manns <Sascha.Manns@directbox.com>'
        puts 'Description: This script can download music from YouTube'
        puts "converts it to MP3 and places it in #{@musicdir}."
        puts 'License: See LICENSE file'
        puts '************************************************************'
        puts 'Usage:'
        puts "#{my_name} YourURL"
        puts 'Example:'
        puts "#{my_name} http://www.youtube.com/watch?v=aHjpOzsQ9YI"
        abort('Aborted')
      end
    end
    def self.check_target
      @entrygroup = ask 'What kind of entry do you have? (Interpret or Group)'

      case
        when @entrygroup == 'Interpret' then
          @firstname = ask 'Whats the first name of your interpret?'
          @surname = ask 'Whats the surname of your interpret?'
          $folder = "#{@surname}_#{@firstname}/Youtube-Music"
        when @entrygroup == 'Group' then
          @group = ask 'Whats the name of the group?'
          $folder = "#{@group}/Youtube-Music"
        else
          puts 'Just the entries "Interpret" or "Group" are allowed'
          abort('Aborted')
      end
    end
    def self.check_dir
      require 'fileutils'
      require 'dir'
      if Dir.exists?("#{$music_dir}/#{$folder}")
        puts 'Found directory. Im using it.'
      else
        puts 'No directory found. Im creating it.'
        FileUtils.mkdir_p("#{$music_dir}/#{$folder}")
        puts 'Created new directory...'
      end
    end
    def self.check_tmpfile
      require 'fileutils'
      require 'dir'
      if File.exists?('*.mp4')
        puts 'Remove unneeded tempfile'
        Dir['*.mp4'].each do |waste|
          File.delete(waste)
        end
      else
        puts 'Temporary file already deleted'
      end
    end
  end

  module Import
    def self.import_config
      config = ParseConfig.new('youtube_dlhelper/youtube_dlhelper.conf')
      $music_dir = config['musicdir'].to_s
    end
  end

  module Downloader
    def self.get(url1)
      require 'viddl-rb'
      download = `viddl-rb -e #{url1}`
    end
  end

  module Ripper
    def self.rip(filename)
      require 'streamio-ffmpeg'
      puts 'Initializing the file'
      movie = FFMPEG::Movie.new("#{filename}.m4a")
      puts 'Initializing finished'
      movie.valid?
      puts 'Validated'
      movie.transcode("#{filename}.m4a", "-acodec libmp3lame -ac 2 -ab 192k #{filename}.mp3")
      puts 'Transcoded'
    end
  end
end