# youtube_dlhelper

The youtube_dlhelper is a short tool for download and manage the downloaded files. You are running the program inside the command line with a Youtube URL. Then it aska for a
group name or interpreters name. Now it creates a Subfolder inside your Musicdirectory. Then it makes a MP3 from the downloaded file and moves it to the folder.


## Installation

The installation is very easy.

    gem install youtube_dlhelper

## Hard dependencies
Just a preinstalled ffmpeg.

## Soft dependencies
I'm using:

* highline
* dir
* fileutils
* parseconfig
* viddl-rb
* streamio-ffmpeg

Such dependencies should be solved directly by the gem manager.

## Usage
youtube_dlhelper.rb YoutubeURL

Example:
youtube_dlhelper.rb http://www.youtube.com/watch?v=aHjpOzsQ9YI (should work on all Linux Versions)
other platforms aren't tested

Before running the program you have to open the youtube_dlhelper.conf and change the Musicdirectory to your one.

## Feature Requests & Bug Reports
You can file Requests and Reports on the Github Repository: https://github.com/saigkill/youtube_dlhelper/issues

## Acknowledgements
My thanks going to:

* James Edward Gray II and Greg Brown (Highline) licensed under GPLv2

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
