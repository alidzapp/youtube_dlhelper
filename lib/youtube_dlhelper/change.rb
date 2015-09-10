# MannsShared Library
# Description: Different shared libraries
# Work: This Module provides different modules and methods for some standard
# tasks
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

# MannsShared Class
class YoutubeDlhelper
  # Method for replacing content in a file
  # @param [String] search is the search text in the target file
  # @param [String] replace the replace text
  # @param [String] file Target file like Author_Group.xml
  # @return [String] true or false
  def self.search_replace(search, replace, file)
    text = File.read(file)
    new_value = text.gsub(search, replace)
    puts new_value
    File.open(file, 'w') do |file1|
      file1.puts new_value
    end
  end
end