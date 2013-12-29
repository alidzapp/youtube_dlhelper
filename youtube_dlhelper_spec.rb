require 'rspec'
require File.expand_path('lib/youtube_dlhelper.rb')

describe YoutubeDlhelper do
  context 'when launched' do
    it 'should have 3 varialbes' do
      url.wont_be_empty
      scriptversion.wont_be_empty
      my_name.wont_be_empty
    end
  end
end

