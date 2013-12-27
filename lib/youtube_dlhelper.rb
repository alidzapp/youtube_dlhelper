#!/usr/bin/env ruby
# Youtube Converter for Ruby
# Description: Downloads a file from a YT URL transcodes them to MP3 and places it into a choosen folder
# Written by: Sascha Manns <Sascha.Manns@directbox.com>
#
# Published under: See LICENSE file

# Dependencies
require File.expand_path('youtube_dlhelper/version')
require File.expand_path('youtube_dlhelper/libs')
require 'highline/import'
require 'dir'
require 'fileutils'
require 'parseconfig'
require 'viddl-rb'
require 'streamio-ffmpeg'

class YoutubeDlhelper
  # Variables
  url = ARGV[0].to_s
  scriptversion = "#{YoutubeDlhelperVersion::Version::STRING}"
  my_name = File.basename('youtube_dlhelper.rb')

  # Main
  YoutubeDlhelperLibs::Checker.check_arguments
  YoutubeDlhelperLibs::Import.import_config
  puts "Script: #{my_name}"
  puts "Version: #{scriptversion}"
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

  @entrygroup = ask 'What kind of entry do you have? (Interpret or Group)'

  case
  when @entrygroup == 'Interpret' then
    @firstname = ask 'Whats the first name of your interpret?'
    @surname = ask 'Whats the surname of your interpret?'
    folder = "#{@surname}_#{@firstname}/Youtube-Music"
  when @entrygroup == 'Group' then
    @group = ask 'Whats the name of the group?'
    folder = "#{@group}/Youtube-Music"
    else
      puts 'Just the entries "Interpret" or "Group" are allowed'
      abort('Aborted')
  end

  puts "Your present Musicfolder is: #{$music_dir}"
  puts 'You can choose another one directly in the configfile.'
  puts 'Checking now, if your targetdirectory exists...'
  if Dir.exists?("#{$music_dir}/#{folder}")
    puts 'Found directory. Im using it.'
  else
    puts 'No directory found. Im creating it.'
    FileUtils.mkdir_p("#{$music_dir}/#{folder}")
    puts 'Created new directory...'
  end

  FileUtils.cd("#{$music_dir}/#{folder}") do
    YoutubeDlhelperLibs::Downloader.get(url)
    if File.exists?('*.mp4')
      puts 'Remove unneeded tempfile'
      Dir['*.mp4'].each do |waste|
        File.delete(waste)
      end
    else
        puts 'Temporary file already deleted'
    end

    file = Dir.entries(Dir::pwd)
    @testfile = file[0]
    @filename = File.basename @testfile, '.m4a'

    YoutubeDlhelperLibs::Ripper.rip(@filename)
    puts 'Cleaning up directory'
    File.delete("#{@filename}.mp4")
    File.delete("#{@filename}.m4a")
    puts 'Finished cleaning up'
  end


  puts "Now you can find your file in #{$music_dir}/#{folder}/#{@filename}.mp3"
  puts "Thank you for using #{my_name}"

end