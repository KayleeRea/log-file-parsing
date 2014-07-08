#!/usr/bin/env ruby

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'log_parser'

logfile = ARGV[0]

puts "Reading log at #{logfile}..."

parser = LogParser.new(File.read(logfile))

puts "Total lines: #{parser.total_lines}"