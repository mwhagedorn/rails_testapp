module Paperclip
  module Instrumentation
    class ExconSubscriber < ActiveSupport::LogSubscriber
      def request(event)
        name   = '%s (%.0fms)' % ["ExCon Request", event.duration]
        params = event.payload.slice(:method,:path).map { |k, v| "#{k}: #{color(v, BOLD, true)}" }.join(', ')
        debug "  #{color(name, RED, true)}  [ #{params} ]"
        Testapp.statsd.timing("friends.excon.request",event.duration)
      end

      def response(event)
        name   = '%s (%.3fms)' % ["ExCon Response", event.duration]
        params = event.payload.slice(:status).map { |k, v| "#{k}: #{color(v, BOLD, true)}" }.join(', ')
        debug "  #{color(name, CYAN, true)}  [ #{params} ]"
        Testapp.statsd.timing("friends.excon.response", event.duration)
      end
    end
  end
end