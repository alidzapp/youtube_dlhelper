#!/usr/bin/env ruby
# Youtube Converter for Ruby
# Description: Downloads a file from a YT URL transcodes them to MP3 and places it into a choosen folder
# Written by: Sascha Manns <Sascha.Manns@directbox.com>
#
# Published under: See LICENSE file

# Dependencies
require File.join(File.dirname(__FILE__), 'youtube_dlhelper/version')
require File.join(File.dirname(__FILE__), 'youtube_dlhelper/libs')
require 'highline/import'
require 'dir'
require 'fileutils2'
require 'parseconfig'
require 'addressable/uri'
require 'viddl-rb'
require 'streamio-ffmpeg'

# The main class YoutubeDlhelper
class YoutubeDlhelper
  # Variables
  $scriptversion = YoutubeDlhelperVersion::Version::STRING
  $my_name = 'youtube_dlhelper.rb'

  YoutubeDlhelperLibs::Checker.check_arguments
  YoutubeDlhelperLibs::Import.import_config

  # Introscreen
  puts "Script: #{$my_name}"
  puts "Version: #{$scriptversion}"
  puts
  puts 'Copyright (C) 2013 Sascha Manns <Sascha.Manns@directbox.com>'
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

  YoutubeDlhelperLibs::Checker.check_target

  # Reflects what targetfolder are used now
  puts "Your present Targetfolder is: #{$music_dir}/#{$folder}"
  puts 'You can choose another one directly in the configfile.'
  puts 'Checking now, if your targetdirectory exists...'
  YoutubeDlhelperLibs::Checker.check_dir

  # Using FileUtils to enter the generated directory
  FileUtils.cd("#{$music_dir}/#{$folder}") do
    puts "Now we are switched to directory #{Dir::pwd}"
    YoutubeDlhelperLibs::Downloader.get($url)

    YoutubeDlhelperLibs::FileHelper.get_filename
    puts Dir::pwd
    puts $filename
    YoutubeDlhelperLibs::Ripper.rip($filename)

    puts 'Cleaning up directory'
    # Cleaning up unneeded files
    File.delete("#{$filename}.mp4")
    File.delete("#{$filename}.m4a")
    puts 'Finished cleaning up'
  end

  puts "Now you can find your file in #{$music_dir}/#{$folder}/#{$filename}.mp3"
  puts "Thank you for using #{$my_name} #{$scriptversion}"

end