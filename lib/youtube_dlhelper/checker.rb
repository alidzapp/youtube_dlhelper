# Youtube Converter for Ruby
# Description: Downloads a file from a YT URL transcodes them to MP3 and places
# it into a choosen folder
# Module: Checker
# Work: This Module provides different checker methods
# Class Documentation:
# http://www.rubydoc.info/github/saigkill/youtube_dlhelper/Checker
#
# Copyright (C) 2013-2015  Sascha Manns <samannsml@directbox.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.


# Dependencies
require 'rainbow/ext/string'
require 'fileutils'
require 'dir'
require 'net/http'
require 'uri'

# The Checker module contains different methods to check anything
module Checker
  # @note This method checks if a url is valid
  # @param [String] url Is the given URL to the Youtube file
  # @return [String] url
  def self.external_url_is_valid?(url)
    puts 'Checking prefix'.color(:green)
    puts url
    if url.include? 'https'
      puts 'Checking if https URL is valid'.color(:green)
      https_url_valid?(url)
      return url
    else
      puts 'Checking if http URL is valid'.color(:green)
      http_url_valid?(url)
      return url
    end
  end

  # Method to check https
  # @param [String] url Is the given URL to the Youtube file
  def self.https_url_valid?(url)
    # @param [String] url Is the given URL to the Youtube file
    uri = URI.parse(url)
    response = Net::HTTP.start(uri.host, uri.port,
                    :use_ssl => uri.scheme == 'https') do |http|
      http.head(uri.path)
    end
    response.is_a?(Net::HTTPSuccess) || response.is_a?(Net::HTTPRedirection)
  end

  # Method to check http
  # @param [String] url Is the given URL to the Youtube file
  def self.http_url_valid?(url)
    # @param [String] url Is the given URL to the Youtube file
    uri = URI.parse(url)
    response = Net::HTTP.start(uri.host, uri.port) do |http|
      http.head(uri.path)
    end
    response.is_a?(Net::HTTPSuccess) || response.is_a?(Net::HTTPRedirection)
  end

  # rubocop:disable Metrics/LineLength
  # Ask for names, creates the folders and puts all into a $folder variable
  # @return [String] folder
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
    subdir.gsub(/ /, '_')
    folder = "#{ subdir }/Youtube-Music"
    return folder
  end

  # Checks if the targetdirectory are present. If not, it creates one
  # @param [String] music_dir Path to the music directory
  # @param [String] folder Path to the targetfolder
  def self.check_dir(music_dir, folder)
    # @note Checking if musicdir exists
    if Dir.exist?("#{music_dir}/#{folder}")
      puts 'Found directory. Im using it.'.color(:green)
    else
      puts 'No directory found. Im creating it.'.color(:green)
      # @note Creates the new directory in $music_dir/$folder
      FileUtils.mkdir_p("#{music_dir}/#{folder}")
      if Dir.exist?("#{music_dir}/#{folder}")
        puts 'Created new directory...'.color(:green)
      else
        fail('Cant create directory')
      end
    end
  end

  # This method checks if a oldconfig is available
  # @return [String] true or false
  def self.oldconfig_exists?
    home = Dir.home
    if File.exist?("#{home}/.youtube_dlhelper.conf")
      puts 'Found configuration file and using it...'.color(:yellow)
    else
      # @raise
      puts 'Please run rake setup'.color(:red)
      fail('Exiting now..').color(:red)
    end
  end

  # This method checks which decoder is available
  # @return [String] ffmpeg_binary
  def self.which_decoder?
    getavconv = `which avconv`
    getffmpeg = `which ffmpeg`
    avconv = p getavconv.chomp
    ffmpeg = p getffmpeg.chomp
    ffmpeg_binary = ffmpeg if ffmpeg != ''
    ffmpeg_binary = avconv if avconv != ''
    return ffmpeg_binary
  end

  # Cleaner method for unneeded files
  # @param [String] filename The name of the new produced file
  def self.cleanup(filename, filenameold)
    puts 'Cleaning up directory'.color(:green)
    # @note Cleanup the temp files
    File.delete("#{filename}.mp4") if File.exist?("#{filename}.mp4")
    File.delete("#{filename}.m4a") if File.exist?("#{filename}.m4a")
    File.delete("#{filename}.webm") if File.exist?("#{filename}.webm")
    File.delete("#{filenameold}.mp4") if File.exist?("#{filenameold}.mp4")
    File.delete("#{filenameold}.m4a") if File.exist?("#{filenameold}.m4a")
    File.delete("#{filenameold}.webm") if File.exist?("#{filenameold}.webm")
    puts 'Finished cleaning up'.color(:green)
  end
end
