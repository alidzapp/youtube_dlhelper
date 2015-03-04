# Youtube Converter for Ruby
# Description: Downloads a file from a YT URL transcodes them to MP3 and places it into a choosen folder
# Written by: Sascha Manns <Sascha.Manns@bdvb.de>
# Module: Parses the configfile and imports the config
# Work: This file contains some standard methods for YoutubeDlhelper
# Published under: See LICENSE file

# Dependencies
require 'parseconfig'

# Module for Importing Informations
module Import
  # This Module parses the youtube_dlhelper.conf and saves the Information in $music_dir and $ogg_file_accept
  def self.import_config
    config = ParseConfig.new(File.join(File.dirname(__FILE__), 'youtube_dlhelper.conf'))
    # saving the variable musiddir in $music_dir
    $music_dir = config['musicdir'].to_s
    # saving the variable ogg_file_accept in $ogg_file_accept
    $ogg_file_accept = config['ogg_file_accept'].to_s
  end
end