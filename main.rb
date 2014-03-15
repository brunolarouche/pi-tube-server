require 'highline/import'

YOUTUBE_URL_PREFIX = "http://www.youtube.com/watch?v="

def download_video url
  system "youtube-dl -o \"../videos/%(id)s\" #{url}"
end

def play_youtube_video youtube_id
  youtube_video_path = Pathname.new("../videos/#{youtube_id}")
  download_video YOUTUBE_URL_PREFIX + youtube_id unless youtube_video_path.exist?

  if youtube_video_path.exist?
    system "omxplayer ../videos/#{youtube_id}"
  else
    puts ''
    say "<%= color('Identifiant invalide, veuillez s.v.p. en saisir un autre.', WARNING) %>"
  end
end

loop do
  puts ''
  puts ''
  puts ''
  youtube_id = ask 'Veuillez saisir l\'identifiant youtube du vidéo que vous désirez démarrer.'
  puts ''
  puts 'Vidéo en chargement, veuillez patienter...'
  play_youtube_video youtube_id
end