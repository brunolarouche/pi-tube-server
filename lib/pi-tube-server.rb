# Gems
require 'highline/import'

# Lib
require_relative 'pi-tube-server/console_helper'
require_relative 'pi-tube-server/youtube_player'

loop do
  puts ''
  puts ''
  youtube_id = ask ConsoleHelper.message_with_style("Veuillez saisir l'identifiant youtube du vidéo que vous désirez démarrer.")
  puts ''
  ConsoleHelper.say_with_style 'Vidéo en chargement, veuillez patienter...'
  YoutubePlayer.play_video youtube_id
end