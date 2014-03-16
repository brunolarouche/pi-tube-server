require 'highline/import'

class ConsoleHelper
  class << self
    def message_with_style message, color = 'WHITE', bold = false
      message = prepare_message message
      message = "<%= color('#{message}'"
      message += ", #{color}"
      message += ', BOLD' if bold
      message += ') %>'
    end

    def say_with_style message, color = 'WHITE', bold = true
      message = message_with_style message, color, bold

      puts ''
      say message
    end

    private

    def prepare_message message
      message.sub "'", "\\\\'"
    end
  end
end