module Paperclip
  module Instrumentation
    class LogSubscriber < ActiveSupport::LogSubscriber

      def new_friend(event)
        return unless logger.debug?
        name   = '%s (%.1fms)' % ["PaperClip New Friend", event.duration]
        params = event.payload[:params].map { |k, v| "#{k}: #{color(v, BOLD, true)}" }.join(', ')
        debug "  #{color(name, BLUE, true)}  [ #{params} ]"
        Testapp.statsd.timing("friends.paperclip.new", event.duration)
      end

      def new_avatar(event)
        return unless logger.debug?
        name   = '%s (%.1fms)' % ["PaperClip Upload Avatar", event.duration]
        params = event.payload[:params].map { |k, v| "#{k}: #{color(v, BOLD, true)}" }.join(', ')
        debug "  #{color(name, WHITE, true)}  [ #{params} ]"
        Testapp.statsd.timing("friends.paperclip.save", event.duration)
      end

      def cpu_reading(event)
        return unless logger.debug?
        name   = '%s' % ["CPU READING"]
        params = `ps -arcwwwxo "command %cpu %mem" | grep -v grep | head -3`.split.each_slice(3).to_a
        debug "  #{color(name, YELLOW, true)}  [ #{params} ]"
      end
    end
  end
end

