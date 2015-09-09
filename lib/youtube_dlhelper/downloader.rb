# Youtube Converter for Ruby
# Description: Downloads a file from a YT URL transcodes them to MP3 or OGG and
# places it into a choosen folder
# Module: Downloader
# Work: It downloads a *.mp4 file from Youtube, then extracts audio to *.m4a
# Class Documentation:
# http://www.rubydoc.info/github/saigkill/youtube_dlhelper/Downloader
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
require 'viddl-rb'
require 'rainbow/ext/string'
require 'fileutils'

# Module for all Downloading things
module Downloader
  # Accessing the url with get(url) via viddl-rb
  # @param [String] url Is the given URL to the Youtube file
  def self.get(url)
    puts 'Downloading file...'.color(:green)
    system('viddl-rb', '-e', "#{url}")
    puts 'Downloading done...'.color(:green)
    rename(url)
  end

  # rubocop:disable Metrics/AbcSize
  # This method smells of :reek:TooManyStatements
  # This method smells of :reek:UncommunicativeVariableName
  # Method for renaming the orig file with blanks to underscores
  # @param [String] url Is the given URL to the Youtube file
  # @return [String] filenamenew The fixed filename with underscores
  def self.rename(url)
    file = ViddlRb.get_names(url)
    file.first
    extn = File.extname file.first.to_s # .mp4
    # Culture Beat           Mr. Vain
    filename = File.basename file.first.to_s, extn
    ext = file_exist_ogg_m4a(filename)
    # @note Replacing blanks with underscrores and delete non standard chars in
    # filename
    filenamenew0 = filename.gsub(/ /, '_')
    pattern = /[a-zA-Z0-9\-\s\_]/
    filenamenew = filenamenew0.split(//).keep_if do |chr|
      chr =~ pattern
    end.join
    puts 'Renaming the downloaded file'.color(:green)
    FileUtils.mv("#{filename}.#{ext}", "#{filenamenew}.#{ext}")
    [filenamenew, filename]
  end

  # It checks what old file are available
  # @param [String] filename
  # @return ext
  def self.file_exist_ogg_m4a(filename)
    if File.exist?("#{filename}.ogg")
      ext = 'ogg'
    elsif File.exist?("#{filename}.m4a")
      ext = 'm4a'
    elsif File.exist?("#{filename}.webm")
      ext = 'webm'
    end
    return ext
  end
end
