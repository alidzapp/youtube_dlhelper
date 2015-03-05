# Youtube Converter for Ruby
# Description: Downloads a file from a YT URL transcodes them to MP3 and places it into a choosen folder
# Written by: Sascha Manns <Sascha.Manns@bdvb.de>
# Module: Ripper
# Work: Checks if is a valid *.m4a file, then transcodes to *.mp3
# Published under: See LICENSE file

# Dependencies
require 'streamio-ffmpeg'

module Ripper
  # Checking which fileformat is present
  def self.rip_prepare
    # Checks if a *.m4a file is present. Then it routes to Ripper.rip
    if File.exist?("#{$filename}.m4a") || File.exist?("#{$filename}.ogg") && $ogg_file_accept == 'false'
      puts 'TRANSCODING TO MP3'
      Ripper.rip($filename)
    else
      puts 'No transcoding needed'
    end
  end

  # Method for transcoding the *.m4a file to *.mp3. Output should be a valid MP3 file.
  def self.rip(filename)
    puts 'Initializing the file'
    if File.exist?("#{filename}.m4a")
      ext = 'm4a'
    end
    if File.exist?("#{filename}.ogg")
      ext = 'ogg'
    end

    # Initialize the file
    movie = FFMPEG::Movie.new("#{filename}.#{ext}")
    puts 'Initializing finished'
    # Checking if valid
    movie.valid?
    puts 'Validated'
    # Transcoding the file to MP3
    movie.transcode("#{filename}.#{ext}", "-acodec libmp3lame -ac 2 -ab 192k #{filename}.mp3")
    puts 'Transcoded'
  end
end