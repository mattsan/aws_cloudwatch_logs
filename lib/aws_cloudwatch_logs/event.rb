module AwsCloudwatchLogs
  class Event
    attr_reader :event_id, :ingestion_time, :log_stream_name, :message, :timestamp

    def initialize(log_event)
      @event_id = log_event.event_id
      @ingestion_time = Time.at(log_event.ingestion_time / 1_000.0)
      @log_stream_name = log_event.log_stream_name
      @message = log_event.message
      @timestamp = Time.at(log_event.timestamp / 1_000.0)
    end
  end
end
