# Gems
require 'highline/import'

# Lib
require_relative 'pi-tube-server/console_helper'
require_relative 'pi-tube-server/models/video'

loop do
  puts ""
  puts ""

  choose do |menu|
    menu.prompt = "Choose an option above"

    menu.choice("Play Youtube/Vimeo video with an URL") { Video.ask_what_video_to_play_and_play }
  end
end