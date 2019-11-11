#!/usr/bin/env ruby


ARGF.each do |line|
  next if line.match(/^PING/)
  data = line.split
  ts = data.first[/\[(.*?)\]/,1] || data.first
  ptime = data[-2].split("=").last
  puts ts + "," + ptime
end
