# Youtube Converter for Ruby
# Description: Downloads a file from a YT URL transcodes them to MP3 and places it into a choosen folder
# Written by: Sascha Manns <Sascha.Manns@directbox.com>
# Module: Checker
# Work: This Module provides different checker methods
# Published under: See LICENSE file

# Dependencies
require 'rainbow/ext/string'
require 'fileutils2'
require 'dir'
require 'net/http'
require 'uri'
require File.join(File.dirname(__FILE__), 'script_structure')

# The Checker module contains different methods to check anything
module Checker
  # This method checks if a url is valid
  def self.external_url_is_valid?(url)
    uri = URI.parse(url)
    response = Net::HTTP.start(uri.host, uri.port) {|http|
      http.head(uri.path)}
    response.is_a?(Net::HTTPSuccess) || response.is_a?(Net::HTTPRedirection)
  end

  # This method checks the Commandline Parameters are given and does a reaction
  def self.check_arguments
        $url = ARGV[0].to_s
        Checker.external_url_is_valid?($url)
  end

  # Ask for names, creates the folders and puts all into a $folder variable
  def self.check_target

    entry = ask 'What kind of entry do you have? (Interpret or Group)'

    subdir = case entry
               when 'Interpret'
                 [
                     ask('Whats the surname of your interpret?'),
                     ask('Whats the first name of your interpret?')
                 ].join('_')

               when 'Group'
                 ask 'Whats the name of the group?'

               else
                 puts 'Just the entries "Interpret" or "Group" are allowed'.color(:red)
                 abort('Aborted')
             end
    $folder = "#{ subdir }/Youtube-Music"
  end

  # Checks if the targetdirectory are present. If not, it creates one
  def self.check_dir
    if Dir.exists?("#{$music_dir}/#{$folder}")
      puts 'Found directory. Im using it.'
    else
      puts 'No directory found. Im creating it.'
      FileUtils.mkdir_p("#{$music_dir}/#{$folder}")
      puts 'Created new directory...'
    end
  end

  module Usage
    # Method for print out the user usage information
    def self.print_usage
      puts "Script: #{MY_NAME} Version: #{SCRIPTVERSION}"
      puts 'Copyright (C) 2014 Sascha Manns <Sascha.Manns@directbox.com>'
      puts 'Description: This script can download music from YouTube'
      puts 'converts it to MP3 and places it in your music directory.'
      puts 'License: See LICENSE file'
      puts '************************************************************'
      puts 'Usage:'
      puts "#{MY_NAME} YourURL"
      puts 'Example:'
      puts "#{MY_NAME} http://www.youtube.com/watch?v=aHjpOzsQ9YI"
      abort('Syntax Error: Please check if you have given a URL')
    end
  end
end