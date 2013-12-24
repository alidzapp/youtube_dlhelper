#!/usr/bin/env ruby
# Youtube Converter for Ruby
# Description: Downloads a file from a YT URL transcodes them to MP3 and places it into a choosen folder
# Written by: Sascha Manns <Sascha.Manns@directbox.com>
#
# Published under: See LICENSE file

# Dependencies
require File.expand_path('lib/youtube_dlhelper/version')
require 'highline/import'
require 'dir'
require 'fileutils'
require 'parseconfig'
require 'yt_mp3'
require 'rake'
require 'rspec'
require 'jeweler'

# Modules

# Methods
def usage
  puts '#{$0} YourURL'
  puts 'Example:'
  puts '#{$0} http://www.youtube.com/watch?v=aHjpOzsQ9YI'
end

# Variables
url = ARGV[0]
$scriptversion = Youtube_dlhelper::Version::STRING
$my_name = File.basename('youtube_dlhelper.rb')
$yt_mp3 = 'yt_mp3/bin/yt_mp3'

# Main
if ARGV.length != 1
  usage
  abort('Aborted')
end
config = ParseConfig.new('lib/youtube_dlhelper.conf')
$musicdir = config['$musicdir']

puts "Script: #{$my_name}"
puts "Version: #{$scriptversion}"
puts
puts 'Copyright (C) 2013 Sascha Manns <Sascha.Manns@directbox.com>'
puts 'Description: This script can download music from YouTube'
puts "converts it to MP3 and places it in #{$musicdir}."
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

@entrygroup = ask 'What kind of entry do you have? (Interpret or Group)'

if @entrygroup == 'Interpret'
  @firstname = ask 'Whats the first name of your interpret?'
  @surname = ask 'Whats the surname of your interpret?'
  $folder = "#{@surname}_#{@firstname}/Youtube-Music"
else
  @group = ask 'Whats the name of the group?'
  $folder = "#{@group}/Youtube-Music"
end

puts "Your present Musicfolder is: #{$musicdir}"
puts 'You can choose another one directly in the configfile.'
puts 'Checking now, if your targetdirectory exists...'
if Dir.exists?("#{$musicdir}/#{$folder}")
  puts 'Found directory. Im using it.'
else
  puts 'No directory found. Im creating it.'
  FileUtils.mkdir_p("#{$musicdir}/#{$folder}")
  puts 'Created new directory...'
end

puts "Echo: #{$musicdir}/#{$folder}"
puts "Echo: #{url}"

FileUtils.cd("#{$musicdir}/#{$folder}") do
  #YoutubeDL::Downloader.download_audio("#{url}", location='tmp/')

end

puts "Now you can find your file in #{$musicdir}/#{$filename}"
puts "Thank you for using #{$my_name}"
