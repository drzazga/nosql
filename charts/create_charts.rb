#!/usr/bin/env ruby

require 'rubygems'
require 'open-uri'
require 'net/http'
require 'json'

resp = Net::HTTP.get_response(URI.parse("http://sigma.ug.edu.pl:14015/movies/_design/app/_view/by_date?group_level=1"))
result = JSON.parse(resp.body)
max = 0
result['rows'].each do |r| max = r["value"] if r["value"] > max end

data = File.open("js/data_year.js", "w")
data.puts("var max = " + max.to_s + "; var movies_by_year = " + resp.body[8..-3])

resp = Net::HTTP.get_response(URI.parse("http://sigma.ug.edu.pl:14015/movies/_design/app/_view/by_runtime?group_level=1"))
resp_count = Net::HTTP.get_response(URI.parse("http://sigma.ug.edu.pl:14015/movies/_design/app/_view/by_runtime?group_level=0"))
data = File.open("js/data_runtime.js", "w")
result = JSON.parse(resp_count.body)

data.puts("var numbers_of_movies = " + result['rows'][0]["value"].to_s + "; var movies_by_runtime = " + resp.body[8..-3])