# Youtube Converter for Ruby
# Description: Downloads a file from a YT URL transcodes them to MP3 and places it into a choosen folder
# Written by: Sascha Manns <Sascha.Manns@directbox.com>
# Module: FileHelper
# Work: Provides the clean filename without extension
# Published under: See LICENSE file

# Dependencies
require 'dir'

# Module for FileHelper tools
module FileHelper
  # Method to get the filename of the downloaded file end excludes the extension
  def self.get_filename
    if File.exists?('*.ogg')
      file = Dir.glob('*.ogg')
      @testfile = file[0]
      $filename = File.basename(@testfile,File.extname(@testfile))
    end
    if File.exists?('*.m4a')
      file = Dir.glob('*.m4a')
      @testfile = file[0]
      $filename = File.basename(@testfile,File.extname(@testfile))
    end
  end
end