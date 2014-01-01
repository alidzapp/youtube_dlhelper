# Youtube Converter for Ruby
# Description: Downloads a file from a YT URL transcodes them to MP3 and places it into a choosen folder
# Written by: Sascha Manns <Sascha.Manns@directbox.com>
# Class: YoutubeDlhelperLibs
# Work: This file contains some standard methods for YoutubeDlhelper
# Published under: See LICENSE file

class YoutubeDlhelperLibs
  module Checker
    def self.valid_url?(url)
      require 'addressable/uri'
      #schemes = %w{http https}
      #parsed == (Addressable::URI.parse(url)) or return false
      #schemes.include?(parsed.scheme)
      uri = Addressable::URI.parse(url)
      uri.scheme
        puts 'Your URL looks valid'
    rescue Addressable::URI::InvalidURIError
      false
      puts 'Sorry. The URL dont looks valid'
      abort('Aborted')
    end

    def self.check_arguments
      puts ARGV.length #debug
      case ARGV.length
        when 0
          YoutubeDlhelperLibs::Usage.print_usage
        when 1
          $url = ARGV[0].to_s
          YoutubeDlhelperLibs::Checker.valid_url?($url)
        when 2
          $url = ARGV[0].to_s
          YoutubeDlhelperLibs::Checker.valid_url?($url)
          if ARGV[1].equal? '--test'
            $testing = true
            puts 'Running in TESTING Environment'
          else
            puts 'Running in normal mode'
          end
        else
          YoutubeDlhelperLibs::Usage.print_usage
      end #end of case
    end #end of def

    def self.check_target
      @entrygroup = ask 'What kind of entry do you have? (Interpret or Group)'

      case @entrygroup
        when 'Interpret' then
          @firstname = ask 'Whats the first name of your interpret?'
          @surname = ask 'Whats the surname of your interpret?'
          $folder = "#{@surname}_#{@firstname}/Youtube-Music"
        when 'Group' then
          @group = ask 'Whats the name of the group?'
          $folder = "#{@group}/Youtube-Music"
        else
          puts 'Just the entries "Interpret" or "Group" are allowed'
          abort('Aborted')
          puts 'Breakpoint'
      end
    end

    def self.check_dir
      #require 'fileutils'
      require 'fileutils2'
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
      require 'fileutils2'
      require 'dir'
      if File.exists?('*.mp4')
        puts 'Remove unneeded tempfile'
        Dir['*.mp4'].each do |waste|
          File.delete(waste)
        end
      else
        puts 'Temporary file already deleted'
      end
    end #end of def
  end #end of module

  module Import
    def self.import_config
      if $testing.equal? true
        $music_dir = '.'
      else
      #config = ParseConfig.new('youtube_dlhelper/youtube_dlhelper.conf')
      config = ParseConfig.new(File.join(File.dirname(__FILE__), 'youtube_dlhelper.conf'))
      $music_dir = config['musicdir'].to_s
      end
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

  module Usage
    def self.print_usage
      puts "Script: #{$my_name} Version: #{$scriptversion}"
      puts 'Copyright (C) 2013 Sascha Manns <Sascha.Manns@directbox.com>'
      puts 'Description: This script can download music from YouTube'
      puts "converts it to MP3 and places it in #{@musicdir}."
      puts 'License: See LICENSE file'
      puts '************************************************************'
      puts 'Usage:'
      puts "#{$my_name} YourURL"
      puts 'Example:'
      puts "#{$my_name} http://www.youtube.com/watch?v=aHjpOzsQ9YI"
      puts 'For testing purposes:'
      puts "#{$my_name} http://www.youtube.com/watch?v=aHjpOzsQ9YI --test"
      abort('Aborted')
    end
  end
end