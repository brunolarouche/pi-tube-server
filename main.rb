require 'highline/import'

YOUTUBE_URL_PREFIX="http://www.youtube.com/watch?v="

def download_video url
  system "youtube-dl -o \"../videos/%(id)s\" #{url}"
end

def play_youtube_video youtube_id
  download_video YOUTUBE_URL_PREFIX + youtube_id unless Pathname.new("../videos/#{youtube_id}").exist?
  system "omxplayer ../videos/#{youtube_id}"
end

ask "Veuillez saisir l'identifiant youtube du vidéo que vous désirez démarrer." do |youtube_id|
  play_youtube_video youtube_id
end