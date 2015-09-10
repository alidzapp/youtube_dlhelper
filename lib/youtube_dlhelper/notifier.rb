#!/usr/bin/env ruby
# encoding: utf-8
# @author Sascha Manns
# @abstract Notifier Module for latex_curriculum_vitae
#
# Copyright (C) 2015  Sascha Manns <samannsml@directbox.com>
# License: GPL-3

# Dependencies

# Module for notify the user
require 'notifier'

# Module for notifying the user
module Notifier
  # Method for notifying the user
  def self.run
    home = Dir.home
    prefix = "#{home}/.rvm/rubies/default"
    datadir = "#{prefix}/share"
    img = "#{datadir}/youtube_dlhelper/100px-youtube_dlhelper.png"
    Notifier.notify(
        :image => "#{img}",
        :title => 'Your YouTube video',
        :message => 'Your transcoding is finished.'
    )
  end
end
