#!/usr/bin/env ruby

require 'rubygems'
require 'couchrest'
require 'yajl'
require 'open-uri'
require 'net/http'
require 'yaml'

if File.exists?("config.yaml") 
    config = YAML.load_file("config.yaml")
else
    puts "Brak pliku konfiguracyjnego config.yaml"
    exit(0)
end

key = config['api_key']
port = config['port']
dbname = config['dbname']

if key.nil? || port.nil? || dbname.nil?
    puts "Nie uzupelniono wszystkich wartosci konfiguracyjnych"
    exit(0)
end

db = CouchRest.database!("http://127.0.0.1:#{port}/#{dbname}") 

1.upto(100) do |page|
    puts "import page: #{page}"

    resp = Net::HTTP.get_response(URI.parse("http://api.themoviedb.org/2.1/Movie.browse/en-US/json/#{key}?order_by=rating&order=desc&page=#{page}&per_page=100"))
        
    parser = Yajl::Parser.new()
    begin 
        hash = parser.parse(resp.body)
        hash.each do |movie|
            movie['_id'] = movie['id'].to_s
            movie.delete('id')
            db.save_doc(movie)
        end
        rescue
            puts "error parsowania"
            next
    end
end
