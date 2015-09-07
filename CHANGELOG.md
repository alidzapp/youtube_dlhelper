# CHANGELOG

## 0.1.9.4 (2015-09-07)
## Improvements
* Changed setup procedure to setup.rb
* Removing /usr/bin/youtube_dlhelper because setup.rb installs in PATH

## 0.1.9.3 (2015-06-15)
### New features
* Using https is now allowed
* Added option to use ffmpeg OR avconv (depends on os)
### Other
* Added user documentation
* Extended automatic tests
* Extended inline code commentation by yard

## 0.1.9 (2015-03-05)
### Improved recipes:
* changed all File.exists? to File.exist?

## 0.1.8 (2015-03-03)
### Improved recipes:
* Updated Dependency to rdoc 4.2.0
* removed double setting of MYNAME and VERSION
* updated usage of File.exists? in rspec

## 0.1.7 (2014-01-18)
### New features:
* title: "New parameter in conf: ogg_file_accept"
* description: "If youtube outputs a webm file, viddl-rb produces a ogg file. If you accept this so no mp3 is needed."
* title: "Terminal Output: The Results file now shows the right extension (mp3 or ogg)"
* title: "Added some raise options"

## 0.1.6 (2014-01-13)
### New features:
* title: "added structure elements for terminal output"
### Improved recipes:
* Changed dependency for multi-json to 1.8.4 for security reasons

## 0.1.5 (2014-01-07)
### Improved recipes:
* using system() for viddl-rb
* rebuild docs

## 0.1.4 (2014-01-06)
### Improved recipes:
* Changed dependency from fileutils to fileutils2 for security reasons.
* Changed dependency from jeweler to 2.0.0
* regenerated docfiles
* changed the lines for finding the filename to File.glob
* added some tests inside the test/ folder
* changed LICENSE.txt to LICENSE.md

## 0.1.3 (2013-12-29)
### Improved recipes:
* Same as 0.1.2.alpha

## 0.1.2 (2013-12-28)
### Improved recipes:
* Nothing special happend. Just for experiment with the commandline release 
tools.

## 0.1.1 (2013-12-24)
### Improved recipes:
* Updated two requires because of security reasons found by the dependency 
checker

## 0.1.0 (2013-12-24)
### New features:
* title: "You give the program a URL and starts it with this as parameter"
* title: "The gem downloads the Video"
* title: "The gem extracts the audio"
* title: "Then it transcodes the file to mp3"
* title: "It asks for a Group or Interprets name and it creates the right 
directories inside your configured Musicfolder"