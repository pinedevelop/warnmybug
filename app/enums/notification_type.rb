class NotificationType < EnumerateIt::Base
  associate_values :log, :warn, :error
end
