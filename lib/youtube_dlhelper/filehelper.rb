# Youtube Converter for Ruby
# Description: Downloads a file from a YT URL transcodes them to MP3 and places it into a choosen folder
# Written by: Sascha Manns <Sascha.Manns@bdvb.de>
# Module: FileHelper
# Work: Provides the clean filename without extension
# Published under: See LICENSE file

# Dependencies
require 'dir'
require 'fileutils2'

# Module for FileHelper tools
module FileHelper
  # Method to get the filename without extension. Method saves the filename in $filename.
  def self.get_filename
    # Submethod for searching for *.ogg files
    Dir.glob('*.ogg') do |ogg_file|
      @testfile = ogg_file
      $filename = File.basename(@testfile,File.extname(@testfile))
    end
    # Submethod for searching for *.m4a files
    Dir.glob('*.m4a') do |m4a_file|
      @testfile = m4a_file
      $filename = File.basename(@testfile,File.extname(@testfile))
    end
  end

  # Checks what resulting file is present
  def self.get_final_file
    if File.exist?("#{$filename}.mp3")
      $extension = 'mp3'
    end
    if File.exist?("#{$filename}.ogg")
      $extension = 'ogg'
    end
  end
end