# youtube_dlhelper - a Gem for Youtubers

| What                          | Status                                                                                                                                                                              |
|-------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| license                       | [![license](http://img.shields.io/:license-gpl3-blue.svg)](http://www.gnu.org/licenses/gpl-3.0.html)                                                                                |
| last public version           | [![publicversion](https://badge.fury.io/rb/youtube_dlhelper.png)](http://rubygems.org/gems/youtube_dlhelper)                                                                      |
| downloads latest              | [![downloads-latest](https://img.shields.io/gem/dtv/youtube_dlhelper.svg)](https://rubygems.org/gems/youtube_dlhelper)                                                            |
| downloads all                 | [![downloads-all](https://img.shields.io/gem/dt/youtube_dlhelper.svg)](https://rubygems.org/gems/youtube_dlhelper)                                                                |
| continuous integration        | [![travis](https://secure.travis-ci.org/saigkill/youtube_dlhelper.png?branch=master)](https://secure.travis-ci.org/saigkill/youtube_dlhelper)                                     |
| continuous integration        | [![scrutinizer](https://scrutinizer-ci.com/g/saigkill/youtube_dlhelper/badges/build.png?b=master)](https://scrutinizer-ci.com/g/saigkill/youtube_dlhelper/build-status/master)   |
| continuous integration        | [![teamcity](http://saigkill.ddns.net:8111/app/rest/builds/buildType:(id:YoutubeDlhelper_Build)/statusIcon)](http://saigkill.ddns.net:8111/viewType.html?buildTypeId=YoutubeDlhelper_Build&guest=1)   |
| test coverage                 | [![coveralls](https://coveralls.io/repos/saigkill/youtube_dlhelper/badge.png?branch=master)](https://coveralls.io/r/saigkill/youtube_dlhelper?branch=master)                      |
| code quality                  | [![codeclimate](https://codeclimate.com/github/saigkill/youtube_dlhelper.png)](https://codeclimate.com/github/saigkill/youtube_dlhelper)                                          |
| code quality                  | [![scrutinizer](https://scrutinizer-ci.com/g/saigkill/youtube_dlhelper/badges/quality-score.png?b=master)](https://scrutinizer-ci.com/g/saigkill/youtube_dlhelper/?branch=master) |
| dependency check              | [![gemnasium](https://gemnasium.com/saigkill/youtube_dlhelper.png)](https://gemnasium.com/saigkill/youtube_dlhelper)                                                              |
| still maintained?             | [![stillmaintained](http://stillmaintained.com/saigkill/youtube_dlhelper.png)](http://stillmaintained.com/saigkill/youtube_dlhelper)                                              |
| documentation quality         | [![documentationquality](http://inch-ci.org/github/saigkill/youtube_dlhelper.svg?branch=master)](http://inch-ci.org/github/saigkill/youtube_dlhelper)                             |
| documentation                 | http://www.rubydoc.info/gems/youtube_dlhelper                                                                                                                                    |
| user documentation            | http://saigkill.github.io/docs/youtube_dlhelper/en-US/html/                                                                                                                                    |
| Bugreports & Feature requests | http://saigkill-bugs.myjetbrains.com/youtrack/issues                                                                                                                              |
| Mailinglist                   | https://groups.google.com/forum/#!forum/youtube_dlhelper |
| authors blog                  | http://saigkill.github.io                                                                                                                                                         |
| openhub statistics            | https://www.openhub.net/p/youtube_dlhelper                                                                                                                                       |
| openhatch                     | http://openhatch.org/projects/youtube_dlhelper |
| donations                     | [![pledgie](https://pledgie.com/campaigns/29423.png?skin_name=chrome)](https://pledgie.com/campaigns/29423)                                                                         |
| donations                     | [![gratipay](http://img.shields.io/gratipay/saigkill.svg)](https://gratipay.com/~saigkill/)                                                                                         |
| donations                     | [![amazon](http://tsv-neuss.de/cms/upload/News-Bilder/amazon1.png)](http://www.amazon.de/registry/wishlist/D75HOEQ00BDD)                                                            |

## Description

The youtube_dlhelper is a short tool for download and manage the downloaded files. You are running the program inside the command line with a Youtube URL. Then it aska for a
group name or interpreters name. Now it creates a Subfolder inside your Musicdirectory. Then it makes a MP3 from the downloaded file and moves it to the folder.

## Installation

The installation is very easy.

    gem install youtube_dlhelper

## Tested Ruby versions

* 2.2.1
* 2.2.2

## Hard dependencies
Just a preinstalled ffmpeg.

## Soft dependencies
I'm using:

* highline
* parseconfig
* viddl-rb
* streamio-ffmpeg
* rainbow

Bundler should solve the dependencies by itself.

## Usage

    bin/youtube_dlhelper YoutubeURL


Example:

    youtube_dlhelper http://www.youtube.com/watch?v=aHjpOzsQ9YI
    If a https:// URL doesn't work use http:// instead

Before running the program you have to open the youtube_dlhelper.conf and change the settings (See Configuration).

## Feature Requests & Bug Reports
You can file Requests and Reports on the Github Repository: http://saigkill-bugs.myjetbrains.com/youtrack/issues

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request