require 'highline/import'

YOUTUBE_URL_PREFIX = "http://www.youtube.com/watch?v="

def download_video url
  `youtube-dl -o \"../videos/%(id)s\" #{url}`
end

def play_youtube_video youtube_id
  youtube_video_path = Pathname.new("../videos/#{youtube_id}")
  download_video YOUTUBE_URL_PREFIX + youtube_id unless youtube_video_path.exist?
  thomas = `omxplayer ../videos/#{youtube_id}`
  p thomas
end

youtube_id = ask('Veuillez saisir l\'identifiant youtube du vidéo que vous désirez démarrer.')
t1=Thread.new{ play_youtube_video youtube_id }
t2=Thread.new{ sleep(30); say "PID : #{$?.pid}" }
t1.join
t2.join