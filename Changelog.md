# Changelog for youtube_dlhelper

## 0.1.4 - 2014-01-01
* [!] Changed dependency from fileutils to fileutils2 for security reasons.
* [!] Changed dependency from jeweler to 2.0.0
* regenerated docfiles
* changed the lines for finding the filename to File.glob
* added some tests inside the spec/ folder
* changed LICENSE.txt to LICENSE.rdoc

## 0.1.3 - 2013-12-29
Same as 0.1.2.alpha

## 0.1.2.alpha - 2013-12-28
Nothing special happend. Just for experiment with the commandline release tools.

## 0.1.1.alpha - 2013-12-24
Updated two requires because of security reasons found by the dependency checker

## 0.1.0.alpha - 2013-12-24
This was the first release of that gem. At this moment all basic features was implemented:
* You give the program a URL and starts it with this as parameter
* The gem downloads the Video
* The gem extracts the audio
* Then it transcodes the file to mp3
* It asks for a Group or Interprets name and it creates the right directories inside your configured Musicfolder
