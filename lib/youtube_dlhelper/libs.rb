# Youtube Converter for Ruby
# Description: Downloads a file from a YT URL transcodes them to MP3 and places it into a choosen folder
# Written by: Sascha Manns <Sascha.Manns@directbox.com>
# Class: YoutubeDlhelperLibs
# Work: This file contains some standard methods for YoutubeDlhelper
# Published under: See LICENSE file

# Library Class for supporting YoutubeDlhelper
class YoutubeDlhelperLibs
  # The Checker module contains different methods to check anything
  module Checker
    # This method checks if a url is valid
    def self.valid_url?(url)
      require 'addressable/uri'
      uri = Addressable::URI.parse(url)
      uri.scheme
      puts 'Your URL looks valid'
    rescue Addressable::URI::InvalidURIError
      false
      puts 'Sorry. The URL dont looks valid'
      abort('Aborted')
    end

    # This method checks how many Commandline Parameters are given and does a reaction
    def self.check_arguments
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

    # Ask for names, creates the folders and puts all into a $folder variable
    def self.check_target

      entry = ask 'What kind of entry do you have? (Interpret or Group)'

      subdir = case entry
                 when 'Interpret'
                   [
                       ask('Whats the first name of your interpret?'),
                       ask('Whats the surname of your interpret?')
                   ].join('_')

                 when 'Group'
                   ask 'Whats the name of the group?'

                 else
                   puts 'Just the entries "Interpret" or "Group" are allowed'
                   puts 'Breakpoint'
                   abort('Aborted')
               end

      $folder = "#{ subdir }/Youtube-Music"
    end

    # Checks if the targetdirectory are present. If not, it creates one
    def self.check_dir
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
  end #end of module


  # Module for Importing Informations
  module Import
    # This Module parses the youtube_dlhelper.conf and gives the information to a $music_dir variable
    def self.import_config
      require 'parseconfig'
      if $testing.equal? true
        $music_dir = '.'
      else
      #config = ParseConfig.new('youtube_dlhelper/youtube_dlhelper.conf')
      config = ParseConfig.new(File.join(File.dirname(__FILE__), 'youtube_dlhelper.conf'))
      $music_dir = config['musicdir'].to_s
      end
    end
  end

  # Module for all Downloading things
  module Downloader
    # Accessing the get(url) method from the Downloader module
    def self.get(url1)
      require 'viddl-rb'
      download = `viddl-rb -e #{url1}`
    end
  end

  module Ripper
    # Methode for transcoding the *.m4a file to *.mp3. Output should be a valid MP3 file.
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

  # Module for FileHelper tools
  module FileHelper
    # Method to get the filename of the downloaded file end excludes the extension
    def self.get_filename
      require 'dir'
      file = Dir.glob('*.m*')
      @testfile = file[0]
      $filename = File.basename(@testfile,File.extname(@testfile))
    end
  end

  # Module for the Usages
  module Usage
    # Method for print out the user usage information
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