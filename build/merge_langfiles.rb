#!/usr/bin/env ruby
require 'pathname'

file1 = Pathname.new ARGV[0]
file2 = Pathname.new ARGV[1]

unless file1.exist? then
  puts "Could not find file 1: #{file1}"
  exit
end

unless file2.exist? then
  puts "Could not find file 2: #{file2}"
  exit
end

inserted = false
File.open(file1).each do |line|
  if !line.include? ");" or inserted
    puts line
  else
    if !inserted
      started = false
      File.open(file2).each do |line|
        puts line if started and !line.include? "charset"
        if line.include? "$aLang" then
          started = true
        end
      end
      inserted = true
    end
  end
end


