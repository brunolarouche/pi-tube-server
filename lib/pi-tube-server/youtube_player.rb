require_relative 'console_helper'

class YoutubePlayer
  YOUTUBE_URL_PREFIX = "http://www.youtube.com/watch?v="

  class << self
    def play_video youtube_id
      youtube_video_path = prepare_video youtube_id
      play_downloaded_video youtube_video_path
    end

    private

    def download_video url
      system "youtube-dl -o \"../videos/%(id)s\" #{url}"
    end

    def prepare_video youtube_id
      youtube_video_path = Pathname.new("../videos/#{youtube_id}")
      download_video YOUTUBE_URL_PREFIX + youtube_id unless youtube_video_path.exist?

      youtube_video_path
    end

    def play_downloaded_video youtube_id
      youtube_video_path = Pathname.new("../videos/#{youtube_id}")

      if youtube_video_path.exist?
        ConsoleHelper.say_with_style 'Démarrage de la lecture du vidéo.', 'GREEN'
        puts ''
        system "omxplayer ../videos/#{youtube_id}"
      end
    end
  end
end