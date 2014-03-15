require 'highline/import'

YOUTUBE_URL_PREFIX = "http://www.youtube.com/watch?v="

def download_video url
  system "youtube-dl -o \"../videos/%(id)s\" #{url}"
end

def play_youtube_video youtube_id
  youtube_video_path = Pathname.new("../videos/#{youtube_id}")
  download_video YOUTUBE_URL_PREFIX + youtube_id unless youtube_video_path.exist?

  if youtube_video_path.exist?
    puts ''
    say "<%= color('Démarrage de la lecture du vidéo.', BOLD, GREEN) %>"
    puts ''
    system "omxplayer ../videos/#{youtube_id}"
  else
    puts ''
    say "<%= color('Identifiant invalide, veuillez s.v.p. en saisir un autre.', BOLD, YELLOW) %>"
  end
end

loop do
  puts ''
  puts ''
  puts ''
  youtube_id = ask "<%= color('Veuillez saisir l\\'identifiant youtube du vidéo que vous désirez démarrer.', BOLD) %>"
  puts ''
  say "<%= color('Vidéo en chargement, veuillez patienter...', BOLD) %>"
  play_youtube_video youtube_id
end