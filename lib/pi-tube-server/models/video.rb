class Video
  VIDEO_FILE_PATH_PREFIX = "../videos/"
  VIMEO_FILE_PATH_PREFIX = "#{VIDEO_FILE_PATH_PREFIX}vimeo/"
  YOUTUBE_FILE_PATH_PREFIX = "#{VIDEO_FILE_PATH_PREFIX}youtube/"

  class << self
    def get_all
      Dir["#{VIDEO_FILE_PATH_PREFIX}**/*"].collect { |file_path| self.new file_path }
    end

    def create_from_url url
      if url.include? 'vimeo'
        file_path = VIMEO_FILE_PATH_PREFIX + url.split('/').last
      elsif url.include? 'youtube'
        file_path = YOUTUBE_FILE_PATH_PREFIX + url.split('=').last
      end

      if file_path
        self.new file_path
      else
        self.new ''
      end
    end

    def ask_what_video_to_play_and_play
      video_url = ask ConsoleHelper.message_with_style("Input the Youtube/Vimeo URL of the video you want to play")
      video = create_from_url video_url.to_s
      video.prepare_and_play video_url
    end
  end

  def initialize file_path
    @file_path = file_path
  end

  def prepare_and_play url
    prepare_video url
    play
  end

  def file_path_exist?
    video_path = Pathname.new(@file_path)
    video_path.exist?
  end

  protected

  def download url
    system "youtube-dl -o \"#{@file_path}\" #{url}"
  end

  def play
    if (file_path_exist?)
      ConsoleHelper.say_with_style 'Video playing!', 'GREEN'
      puts ''
      system "omxplayer #{@file_path}"
    end
  end

  def prepare_video url
    download url unless file_path_exist?
  end
end