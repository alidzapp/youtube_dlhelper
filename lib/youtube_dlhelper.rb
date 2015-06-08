#!/usr/bin/env ruby
# Youtube Converter for Ruby
#
# Copyright (C) 2013-2015  Sascha Manns <Sascha-Manns@web.de>
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
require 'youtube_dlhelper/version'
require 'youtube_dlhelper/checker'
require 'youtube_dlhelper/downloader'
require 'youtube_dlhelper/import_config'
require 'youtube_dlhelper/ripper'
require 'highline/import'
require 'dir'
require 'fileutils'
require 'parseconfig'
require 'addressable/uri'
require 'viddl-rb'
require 'streamio-ffmpeg'
require 'rainbow/ext/string'

# The main class YoutubeDlhelper
class YoutubeDlhelper

  # @note Version variable
  version = YoutubeDlhelperVersion::Version::STRING

  # @note Name of the App
  my_name = 'youtube_dlhelper.rb'

  # @note Command line aguments
  argv = ARGV[0].to_s

  # @note Imports the configuration
  home = Dir.home
  music_get, ogg_file_accept = Import.import_config
  music_dir = "#{home}/#{music_get}"

  puts "Script: #{my_name}".color(:yellow)
  puts "Version: #{version}".color(:yellow)
  puts
  puts 'Copyright (C) 2013-2015 Sascha Manns <Sascha-Manns@web.com>'
  puts 'Description: This script can download music from YouTube'
  puts "converts it to OGG/MP3 and places it in #{music_dir}."
  puts 'License: See LICENSE file'
  puts ''
  puts 'This program is free software: you can redistribute it and/or modify'
  puts 'it under the terms of the GNU General Public License as published by'
  puts 'the Free Software Foundation, either version 3 of the License, or'
  puts '(at your option) any later version.'
  puts ''
  puts 'This program is distributed in the hope that it will be useful,'
  puts 'but WITHOUT ANY WARRANTY; without even the implied warranty of'
  puts 'MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the'
  puts 'GNU General Public License for more details.'
  puts 'You should have received a copy of the GNU General Public License'
  puts 'along with this program.  If not, see <http://www.gnu.org/licenses/>.'

  # @note Checks if the URL is valid
  # @param [String] argv Given
  url = Checker.external_url_is_valid?(argv)

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

  # @note Check oldconfig
  oldconfig_exists?

  # Check which decoder should used
  ffmpeg_binary = Checker.which_decoder?

  puts 'CHECKING TARGET'.color(:yellow)
  # @note Checks if target directory is present. Otherwise it creates one
  folder = Checker.check_target

  # @note Prints out which targetfolder is choosen.
  puts 'SEARCHING FOR TARGETDIR'
  puts "Your present Targetfolder is: #{music_dir}/#{folder}".color(:yellow)
  puts 'You can choose another one directly in the configfile.'
  puts 'Checking now, if your targetdirectory exists...'
  # @param [String] music_dir Path to the music directory
  # @param [String] folder Path to the targetfolder
  Checker.check_dir(music_dir, folder)

  # @note Using FileUtils to enter the generated directory
  puts 'SWITCHING TO TARGETDIR'.color(:yellow)

  FileUtils.cd("#{music_dir}/#{folder}") do
    puts "Now we are switched to directory #{Dir.pwd}".color(:yellow)
    puts 'DOWNLOADING YOUR VIDEO'

    # @param [String] url Is the given URL to the Youtube file
    filename = Downloader.get(url)

    # @param [String] filename The filename
    # @param [String] ogg_file_accept OGG file as end file accepted?
    # (true/false)
    # @param [String] ffmpeg_binary Path to the ffmpeg binary
    filenamenew, extension = Ripper.rip_prepare(filename, ogg_file_accept,
                                                ffmpeg_binary)

    # @param [String] filenamenew The new produced filename
    Checker.cleanup(filenamenew)

    puts "Now you can find your file in
\#{music_dir}/#{folder}/#{filenamenew}.#{extension}".color(:yellow)
    puts "Thank you for using #{my_name} #{version}".color(:yellow)
  end
end
