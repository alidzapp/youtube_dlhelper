# Youtube Converter for Ruby
# Description: Downloads a file from a YT URL transcodes them to MP3 and places it into a choosen folder
# Written by: Sascha Manns <Sascha.Manns@bdvb.de>
# Module: Usage
# Work: It prints out a usage message
# Published under: See LICENSE file

module Usage
  # Method for print out the user usage information
  def self.print_usage
    puts "Script: #{$my_name} Version: #{$version}"
    puts 'Copyright (C) 2014 Sascha Manns <Sascha.Manns@bdvb.de>'
    puts 'Description: This script can download music from YouTube'
    puts 'converts it to MP3 and places it in your music directory.'
    puts 'License: See LICENSE file'
    puts '************************************************************'
    puts 'Usage:'
    puts "#{$my_name} YourURL"
    puts 'Example:'
    puts "#{$my_name} http://www.youtube.com/watch?v=aHjpOzsQ9YI"
  end
end