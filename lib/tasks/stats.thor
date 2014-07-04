#ps -axo pcpu,pmem,comm | sort -k 1 -r | head -10 

class MyApp < Thor                                                 # [1]
  include Thor::Actions

  @@loop = true

  desc "poll", "continually display cpu usage"
  def poll
   while(@@loop)
     say("-----------------------")
      processes
      sleep(1)
    end
  end

  desc "processes", "list the top memory and cpu processes"
  def processes
    value = `ps -axo pcpu,pmem,comm | sort -k 1 -r | head -4`
    say(value,:magenta)
    ActiveSupport::Notifications.instrument "my.custom.event", this: :data do
        value
    end
  end

  desc "start_logging", "start process logging"
  def start_logging
    poll
  end

  desc "end_logging", "end process logging"
  def end_logging
    @@loop = false
  end
end
