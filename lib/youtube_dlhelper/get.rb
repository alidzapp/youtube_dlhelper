# Youtube Converter for Ruby
# Description: Downloads a file from a YT URL transcodes them to MP3 or OGG and
# places it into a choosen folder
# Module: Downloader
# Work: It downloads a *.mp4 file from Youtube, then extracts audio to *.m4a
# Class Documentation:
# http://www.rubydoc.info/github/saigkill/youtube_dlhelper/Downloader
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

# Class for methods who getting informations
module YoutubeDlhelperGet

  # Method for getting the url
  # @return [String] urlchecked
  def self.url
    # @note Put the yad input
    urlinput = `yad --entry --button="Go" --title="URL" --text="Place your URL:"`
    puts urlinput
    return urlinput
  end

  # Method for getting the type of the musicans
  def self.type
    # @note Put the yad input
    type = `yad --title="Create documentation" --center --on-top --text="Is it a group or a single interpret" --button="Group" --button="Interpret"`
    puts type

  end
end
