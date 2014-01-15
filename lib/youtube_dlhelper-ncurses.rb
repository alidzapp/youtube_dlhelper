#!/usr/bin/env ruby
# Youtube Converter for Ruby
# Description: Downloads a file from a YT URL transcodes them to MP3 and places it into a choosen folder
# Written by: Sascha Manns <Sascha.Manns@directbox.com>
#
# Published under: See LICENSE file

# Dependencies
require File.join(File.dirname(__FILE__), 'youtube_dlhelper/version')
require File.join(File.dirname(__FILE__), 'youtube_dlhelper/checker')
require File.join(File.dirname(__FILE__), 'youtube_dlhelper/downloader')
require File.join(File.dirname(__FILE__), 'youtube_dlhelper/filehelper')
require File.join(File.dirname(__FILE__), 'youtube_dlhelper/import_config')
require File.join(File.dirname(__FILE__), 'youtube_dlhelper/ripper')

require 'highline/import'
require 'dir'
require 'fileutils2'
require 'parseconfig'
require 'addressable/uri'
require 'viddl-rb'
require 'streamio-ffmpeg'
require 'ncurses'
require 'logger'
require 'rbcurse-core'
#require 'rbcurse/rwidget'

# Variables
SCRIPTVERSION = YoutubeDlhelperVersion::Version::STRING
MY_NAME = 'youtube_dlhelper.rb'

class YoutubeDlhelperNcurses
  VER::start_ncurses # Init Ncurses

end