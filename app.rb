require 'rubygems'
require 'bundler/setup'
require 'sinatra'

# set(:locale) {|locale| conditions {value} }

before '/*' do
  unless request.path_info == '/'
    while request.path_info[-1] == '/'
      request.path_info = request.path_info[0..-2]
    end
  end
end

get '/project' do
  redirect 'http://packages.altlinux.org/ru/project', 301
end

get %r{/(en|ru|uk|br)/project} do |locale|
  redirect "http://packages.altlinux.org/#{locale}/project", 301
end

get '/security' do
  redirect 'http://packages.altlinux.org/ru/security', 301
end

get %r{/(en|ru|uk|br)/security} do |locale|
  redirect "http://packages.altlinux.org/#{locale}/security", 301
end

get '/people' do
  redirect 'http://packages.altlinux.org/ru/Sisyphus/people', 301
end

get %r{/(en|ru|uk|br)/people} do |locale|
  redirect "http://packages.altlinux.org/#{locale}/Sisyphus/people", 301
end

get '/team/:team' do |team|
  redirect "http://packages.altlinux.org/ru/Sisyphus/teams/#{team}", 301
end

get '/' do
  redirect 'http://packages.altlinux.org/ru', 301
end

get %r{/(en|ru|uk|br)} do |locale|
  redirect "http://packages.altlinux.org/#{locale}", 301
end
