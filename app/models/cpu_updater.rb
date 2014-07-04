class CpuUpdater
  def initialize
    @proceed = true
  end

  def stop
    @proceed = false
  end

  def do_cpu_logging
    background do
      while(@proceed)
        ActiveSupport::Notifications.instrument("cpu_reading.paperclip")
        sleep(1)
      end
    end
  end


  def background(&block)
    Thread.new do
      yield
    end
  end
end