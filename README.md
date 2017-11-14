# AwsCloudwatchLogs

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/aws_cloudwatch_logs`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'aws_cloudwatch_logs'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install aws_cloudwatch_logs

## Usage

```ruby
require 'aws_cloudwatch_logs'

end_time = Time.now
start_time = end_time - 60 * 60 # 1 hour ago
filter_pattern = '"timed out"' # if nil get all log events
AwsCloudwatchLogs.extract(LOG_GROUP_NAME, start_time, end_time, filter_pattern) do |event|
  puts <<~EOS
           event_id: #{event.event_id}
          timestamp: #{event.timestamp.strftime('%Y-%m-%dT%H:%M:%S%Z'}
     ingestion_time: #{event.ingestion_time.strftime('%Y-%m-%dT%H:%M:%S%Z'}
    log_stream_name: #{event.log_stream_name}
            message: #{event.message}
  EOS
end
```

cf.

| contents | URL |
|---|---|
| aws-sdk | http://docs.aws.amazon.com/sdkforruby/api/Aws/CloudWatchLogs/Client.html |
| event entity | http://docs.aws.amazon.com/ja_jp/AmazonCloudWatch/latest/logs/FilterAndPatternSyntax.html |
| filter pattern |http://docs.aws.amazon.com/sdkforruby/api/Aws/CloudWatchLogs/Types/FilteredLogEvent.html |

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mattsan/aws_cloudwatch_logs.
