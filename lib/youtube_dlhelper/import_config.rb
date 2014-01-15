# Youtube Converter for Ruby
# Description: Downloads a file from a YT URL transcodes them to MP3 and places it into a choosen folder
# Written by: Sascha Manns <Sascha.Manns@directbox.com>
# Module: Parses the configfile and imports the config
# Work: This file contains some standard methods for YoutubeDlhelper
# Published under: See LICENSE file

# Dependencies
require 'parseconfig'

# Module for Importing Informations
module Import
  # This Module parses the youtube_dlhelper.conf and gives the information to a $music_dir variable
  def self.import_config
    config = ParseConfig.new(File.join(File.dirname(__FILE__), 'youtube_dlhelper.conf'))
    $music_dir = config['musicdir'].to_s
    $ogg_file_accept = config['ogg_file_accept'].to_s
  end
end