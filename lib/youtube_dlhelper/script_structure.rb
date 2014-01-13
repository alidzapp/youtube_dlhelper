# Boxes for Ruby
# Description: Draws boxes around a text
# Written by: Sascha Manns <Sascha.Manns@directbox.com>
# Module: Style
# Work: It draws boxes around a text
# Published under: See LICENSE file

module Style
  def self.box_full
    puts '*' * 67
  end

  def self.box_content(content)
    box_rest = 66 - content.length
    box_rest.to_i
    print '* ' + box_rest * '*'
    #print content

  end
end