require 'rubygems'
require 'sinatra'
require 'json'
require 'open-uri'

get '/' do
  links = JSON.parse(open("http://reddit.com/r/pics/top.json").read)['data']['children']
  links.inspect
end
