#ActiveSupport::Notifications.subscribe "my.custom.event" do |name, started, finished, unique_id, data|
#    puts data.inspect # {:this=>:data}
#end

Paperclip::Instrumentation::LogSubscriber.attach_to :paperclip
Paperclip::Instrumentation::ExconSubscriber.attach_to :excon
