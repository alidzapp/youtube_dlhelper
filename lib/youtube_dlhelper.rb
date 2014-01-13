#!/usr/bin/env ruby
# Youtube Converter for Ruby
# Description: Downloads a file from a YT URL transcodes them to MP3 and places it into a choosen folder
# Written by: Sascha Manns <Sascha.Manns@directbox.com>
#
# Published under: See LICENSE file

# Dependencies
require File.join(File.dirname(__FILE__), 'youtube_dlhelper/version')
require File.join(File.dirname(__FILE__), 'youtube_dlhelper/checker')
require File.join(File.dirname(__FILE__), 'youtube_dlhelper/downloader')
require File.join(File.dirname(__FILE__), 'youtube_dlhelper/filehelper')
require File.join(File.dirname(__FILE__), 'youtube_dlhelper/import_config')
require File.join(File.dirname(__FILE__), 'youtube_dlhelper/ripper')
require File.join(File.dirname(__FILE__), 'youtube_dlhelper/script_structure')
require 'highline/import'
require 'dir'
require 'fileutils2'
require 'parseconfig'
require 'addressable/uri'
require 'viddl-rb'
require 'streamio-ffmpeg'
require 'rainbow/ext/string'

# Variables
SCRIPTVERSION = YoutubeDlhelperVersion::Version::STRING
MY_NAME = 'youtube_dlhelper.rb'


# The main class YoutubeDlhelper
class YoutubeDlhelper

  Checker.check_arguments
  Import.import_config

  Style.box_full
  # Introscreen
  puts "Script: #{MY_NAME}".color(:yellow)
  puts "Version: #{SCRIPTVERSION}".color(:yellow)
  puts
  puts 'Copyright (C) 2014 Sascha Manns <Sascha.Manns@directbox.com>'
  puts 'Description: This script can download music from YouTube'
  puts "converts it to MP3 and places it in #{$music_dir}."
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
  Style.box_full

  puts
  puts
  Checker.check_target

  # Reflects what targetfolder are used now
  puts
  Style.box_full
  puts'SEARCHING FOR TARGETDIR'
  Style.box_full
  puts "Your present Targetfolder is: #{$music_dir}/#{$folder}"
  puts 'You can choose another one directly in the configfile.'
  puts 'Checking now, if your targetdirectory exists...'
  Checker.check_dir
  puts
  puts

  # Using FileUtils to enter the generated directory
  Style.box_full
  puts 'SWITCHING TO TARGETDIR'
  Style.box_full
  puts
  FileUtils.cd("#{$music_dir}/#{$folder}") do
    puts "Now we are switched to directory #{Dir::pwd}".color(:red)
    puts
    Style.box_full
    puts 'DOWNLOADING YOUR VIDEO'
    Style.box_full

    Downloader.get($url)
    Style.box_full
    puts
    FileHelper.get_filename

    Style.box_full
    puts 'TRANSCODING TO MP3'
    Style.box_full
    puts
    Ripper.rip($filename)

    puts 'Cleaning up directory'
    # Cleaning up unneeded files
    File.delete("#{$filename}.mp4")
    File.delete("#{$filename}.m4a")
    puts 'Finished cleaning up'
  end

  Style.box_full
  puts "Now you can find your file in #{$music_dir}/#{$folder}/#{$filename}.mp3".color(:yellow)
  puts "Thank you for using #{MY_NAME} #{SCRIPTVERSION}".color(:yellow)
  Style.box_full

end