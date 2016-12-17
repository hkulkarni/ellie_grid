#!/usr/bin/env ruby
require 'rest-client'

def call(host)
    puts "Sending reminders: #{Time.now}"
    RestClient.get("#{host}/send_reminders")
rescue RestClient::Exception => exception
    STDERR.puts("Error: #{exception.message}")
end

host = "http://localhost:3000"
# Call send reminders endpoint every N seconds
while true
  call(host)
  sleep(5)
end
