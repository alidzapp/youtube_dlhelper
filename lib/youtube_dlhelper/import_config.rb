# Youtube Converter for Ruby
# Description: Downloads a file from a YT URL transcodes them to MP3 and places
# it into a choosen folder
# Module: Parses the configfile and imports the config
# Work: This file contains some standard methods for YoutubeDlhelper
# Class Documentation:
# http://www.rubydoc.info/github/saigkill/youtube_dlhelper/Import
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
require 'parseconfig'

# Module for Importing Informations
module Import
  # This Module parses the youtube_dlhelper.conf
  # @return [Array] music_dir, ogg_file_accept, ffmpeg_binary
  def self.import_config
    home = Dir.home
    config = ParseConfig.new(File.join("#{home}/.youtube_dlhelper/youtube_dlhelper.conf"))
    # @note Saving the variable musiddir
    music_dir = config['musicdir'].to_s
    # @note Saving the variable ogg_file_accept
    ogg_file_accept = config['ogg_file_accept'].to_s
    # @note It returns a array with music_dir, ogg_file_accept, ffmpeg_binary
    [music_dir, ogg_file_accept]
  end
end
