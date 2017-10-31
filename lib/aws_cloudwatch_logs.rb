require 'aws_cloudwatch_logs/version'
require 'aws_cloudwatch_logs/event'

require 'aws-sdk'

module AwsCloudwatchLogs
  def self.extract(group, start_time, end_time, filter_pattern)
    params = initial_params(group, start_time, end_time, filter_pattern)

    client = Aws::CloudWatchLogs::Client.new # TODO: add configuring region and credentials

    loop do
      events = client.filter_log_events(params)

      events.events.each do |event|
        yield Event.new(event)
      end

      break unless events.next_token

      params[:next_token] = events.next_token
    end
  end

  def self.initial_params(group, start_time, end_time, filter_pattern)
    {
      log_group_name: group,
      start_time: start_time.to_i * 1_000,
      end_time: end_time.to_i * 1_000,
      filter_pattern: filter_pattern,
      interleaved: true
    }
  end
end
