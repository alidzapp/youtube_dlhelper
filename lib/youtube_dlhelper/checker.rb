# Youtube Converter for Ruby
# Description: Downloads a file from a YT URL transcodes them to MP3 and places it into a choosen folder
# Written by: Sascha Manns <Sascha.Manns@bdvb.de>
# Module: Checker
# Work: This Module provides different checker methods
# Published under: See LICENSE file

# Dependencies
require 'rainbow/ext/string'
require 'fileutils2'
require 'dir'
require 'net/http'
require 'uri'

# The Checker module contains different methods to check anything
module Checker
  # This method checks if a url is valid
  def self.external_url_is_valid?(url)
    uri = URI.parse(url)
    response = Net::HTTP.start(uri.host, uri.port) {|http|
      http.head(uri.path)}
    response.is_a?(Net::HTTPSuccess) || response.is_a?(Net::HTTPRedirection)
  end

  # This method parses the ARGV for a url and checks if valid with the external_url_is_valid? method
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
    # Checking if musicdir exists
    if Dir.exist?("#{$music_dir}/#{$folder}")
      puts 'Found directory. Im using it.'
    else
      puts 'No directory found. Im creating it.'
      # Creates the new directory in $music_dir/$folder
      FileUtils.mkdir_p("#{$music_dir}/#{$folder}")
      if Dir.exist?("#{$music_dir}/#{$folder}")
        raise('Cant create directory')
      else
      puts 'Created new directory...'
      end
    end
  end

  # Cleaner method for unneeded files
  def self.cleanup
    puts 'Cleaning up directory'
    # Cleanup the temp files
    if File.exist?("#{$filename}.mp4")
      File.delete("#{$filename}.mp4")
    end
    if File.exist?("#{$filename}.m4a")
      File.delete("#{$filename}.m4a")
    end
    if File.exist?("#{$filename}.webm")
      File.delete("#{$filename}.webm")
    end
    puts 'Finished cleaning up'
  end
end
