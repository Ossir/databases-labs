#!/usr/bin/env ruby -wKU
require 'csv'
require 'json'

csv_file_path = ARGV[0]

csv_data = ''

File.foreach(csv_file_path) do |line|
    csv_data << line
end

# Convert csv data to json
log_arr = []

CSV.foreach(csv_file_path) do |csv_entry|
    log_arr << {
        :url         => csv_entry[0],
        :ip_adress   => csv_entry[1],
        :time_stamp  => csv_entry[2],
        :time_spent  => csv_entry[3]
    }
end

# Write json data
json_file_path = ARGV[1]

File.open(json_file_path, 'w') do |json|
    json << log_arr.to_json
end