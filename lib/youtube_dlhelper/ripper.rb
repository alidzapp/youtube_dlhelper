# Youtube Converter for Ruby
# Description: Downloads a file from a YT URL transcodes them to MP3 and places it into a choosen folder
# Written by: Sascha Manns <Sascha.Manns@directbox.com>
# Module: Ripper
# Work: Checks if is a valid *.m4a file, then transcodes to *.mp3
# Published under: See LICENSE file

# Dependencies
require 'streamio-ffmpeg'

module Ripper
  # Methode for transcoding the *.m4a file to *.mp3. Output should be a valid MP3 file.
  def self.rip(filename)
    puts 'Initializing the file'
    movie = FFMPEG::Movie.new("#{filename}.m4a")
    puts 'Initializing finished'
    movie.valid?
    puts 'Validated'
    movie.transcode("#{filename}.m4a", "-acodec libmp3lame -ac 2 -ab 192k #{filename}.mp3")
    puts 'Transcoded'
  end
end