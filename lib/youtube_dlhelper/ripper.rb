# Youtube Converter for Ruby
# Description: Downloads a file from a YT URL transcodes them to MP3 and places
# it into a choosen folder
# Module: Ripper
# Work: Checks if is a valid *.m4a file, then transcodes to *.mp3
# Class Documentation:
# http://www.rubydoc.info/github/saigkill/youtube_dlhelper/Ripper
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
require 'streamio-ffmpeg'

# Module for all ripping methods
module Ripper
  # rubocop:disable Metrics/AbcSize
  # This method smells of :reek:TooManyStatements
  # Checking which fileformat is present
  # @param [String] filename The filename
  # @param [String] ogg_file_accept OGG file as end file accepted? (true/false)
  # @param [String] ffmpeg_binary Path to the ffmpeg binary
  def self.rip_prepare(filename, ogg_file_accept, ffmpeg_binary)
    # @note Checks if a *.m4a file is present. Then it routes to Ripper.rip
    puts 'Checking if transcoding is needed. Depends on ogg_file_accept.'
    if File.exist?("#{filename}.m4a")
      puts 'TRANSCODING TO MP3'
      ext = 'm4a'
      rip(filename, ext, ogg_file_accept, ffmpeg_binary)
    elsif File.exist?("#{filename}.ogg") && ogg_file_accept == 'false'
      puts 'TRANSCODING TO MP3'
      ext = 'ogg'
      rip(filename, ext, ogg_file_accept, ffmpeg_binary)
    elsif File.exist?("#{filename}.ogg")
      puts 'Already a ogg file. No transcoding needed'
    else
      puts 'No transcoding needed'
    end
  end

  # rubocop:disable Metrics/LineLength
  # This method smells of :reek:TooManyStatements
  # This method smells of :reek:LongParameterList
  # Method for transcoding the *.m4a file to *.mp3. Output should be a valid MP3
  # file.
  # @param [String] filename The filename
  # @param [String] ext The file extension
  # @param [String] ogg_file_accept OGG file as end file accepted? (true/false)
  # @param [String] ffmpeg_binary Path to the ffmpeg binary
  # @return [String] filename, ext
  def self.rip(filename, ext, ogg_file_accept, ffmpeg_binary)
    # @note Initialize the file
    FFMPEG.ffmpeg_binary = ffmpeg_binary
    filenamein = "#{filename}.#{ext}"
    audio = FFMPEG::Movie.new(filenamein)
    puts 'Initializing finished'
    # @note Checking if valid
    puts 'Checking if the movie is valid.'
    audio.valid?
    puts 'Validated'
    ext = convert(ogg_file_accept, ffmpeg_binary, filenamein, filename)
    puts 'Transcoded'
    [filename, ext]
  end

  # Method for converting stuff
  # This method smells of :reek:TooManyStatements
  # This method smells of :reek:LongParameterList
  # @param [String] ogg_file_accept OGG file as result accepted?
  # @param [String] ffmpeg_binary Path to the ffmpeg binary
  # @param [String] filenamein The original file
  # @param [String] filename The transcoded file
  # @return [String] ext
  def self.convert(ogg_file_accept, ffmpeg_binary, filenamein, filename)
    # @note Transcoding the file to MP3
    if ogg_file_accept == 'true'
      system("#{ffmpeg_binary} -i #{filenamein} -acodec vorbis -vn -ac 2 -aq 60 -strict -2 #{filename}.ogg")
      ext = 'ogg'
      puts ext
    else
      system("#{ffmpeg_binary} -i #{filenamein} -acodec libmp3lame -ac 2 -ab 192k #{filename}.mp3")
      ext = 'mp3'
      puts ext
    end
    return ext
  end
end
