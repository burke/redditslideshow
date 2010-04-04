require 'rubygems'
require 'sinatra'
require 'json'
require 'open-uri'
require 'erb'

def make_slideshow
  JSON.
    parse(open("http://reddit.com/r/pics/top.json").read).
    fetch('data').
    fetch('children').
    map{|e|e['data']}.
    select{|e|%{gif jpg png}.include? e['url'][-3..-1]}.
    map{|x|"<a href='#{x['permalink']}'><img src='#{x['url']}' title='#{x['title']}'/></a>"}.
    join("\n")
end

get '/' do
  erb :index, :locals => {:slideshow => make_slideshow}
end
