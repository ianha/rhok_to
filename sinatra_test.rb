require 'rubygems'
require 'sinatra'
require 'nokogiri'
require 'open-uri'
require 'pp'
require 'json'

get '/' do
  "Random hack of kindness!"
end

get '/example.json' do
  content_type :json
  doc = Nokogiri::HTML(open('http://en.wikipedia.org/wiki/List_of_countries_by_population'))
  country = {}
  
  doc.css('table.wikitable tbody tr').each do |node|
    json[:content] = node.content
  end
  
    # [
    #   [:country, 'textarea#csi']
    # ].collect do |name, css|
    #   json[name] = doc.at_css(css).content
    # end
  
  json.to_json
end
  