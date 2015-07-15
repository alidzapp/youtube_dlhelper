# Youtube Converter for Ruby
# Description: Downloads a file from a YT URL transcodes them to MP3 and places it into a choosen folder
# Class: youtube_dlhelper
# Work: This file contains a semantic version number
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

# Class for versioning
class YoutubeDlhelperVersion
  # Module for versioning
  module Version
    # Major version
    MAJOR = 0
    # Minor version
    MINOR = 1
    # Patch version
    PATCH = 9
    # Build version
    BUILD = 3

    # combined string with the full version
    STRING = [MAJOR, MINOR, PATCH].compact.join('.')
  end
end

