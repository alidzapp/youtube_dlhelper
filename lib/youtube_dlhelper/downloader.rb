# Youtube Converter for Ruby
# Description: Downloads a file from a YT URL transcodes them to MP3 and places it into a choosen folder
# Written by: Sascha Manns <Sascha.Manns@bdvb.de>
# Module: Downloader
# Work: It downloads a *.mp4 file from Youtube, then extracts audio to *.m4a
# Published under: See LICENSE file

# Dependencies
require 'viddl-rb'

# Module for all Downloading things
module Downloader
  # Accessing the url with get(url) via viddl-rb
  def self.get(url1)
    system('viddl-rb', '-e', "#{url1}")
  end
end