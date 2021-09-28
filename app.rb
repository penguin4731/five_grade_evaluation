require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models/count.rb'

before do
  if Count.all.size == 0
    Count.create(
      excellent:1,
      verygood:1,
      good:1,
      average:1,
      poor:1
      )
  end
end

get '/' do
  # Count.all.delete
  @number = Count.first
  erb :index
end

get '/success' do
  erb :success
end

get '/view' do
  # Count.all.delete
  @number = Count.first
  erb :view
end

post '/eplus' do
  count = Count.first
  count.excellent = count.excellent + 1
  count.save
  redirect '/success'
end

post '/vplus' do
  count = Count.first
  count.verygood = count.verygood + 1
  count.save
  redirect '/success'
end

post '/gplus' do
  count = Count.first
  count.good = count.good + 1
  count.save
  redirect '/success'
end

post '/aplus' do
  count = Count.first
  count.average = count.average + 1
  count.save
  redirect '/success'
end

post '/pplus' do
  count = Count.first
  count.poor = count.poor + 1
  count.save
  redirect '/success'
end