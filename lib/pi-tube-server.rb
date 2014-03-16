# Gems
require 'highline/import'

# Lib
require_relative 'pi-tube-server/console_helper'
require_relative 'pi-tube-server/youtube_player'

loop do
  puts ""
  puts ""

  choose do |menu|
    menu.prompt = "Choose an option above"

    menu.choice("Play Youtube video with an Youtube video ID") { YoutubePlayer.ask_about_a_video_to_play }
  end
end