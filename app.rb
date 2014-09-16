require 'sinatra'
require 'parse-ruby-client'

Parse.init application_id: ENV['PARSE_APP_ID'],
           api_key: ENV['PARSE_API_KEY']

get '/' do
  erb :index
end

post '/notify' do
	data = {}
	data[:customAlert] = params["description"]
	data[:action] = "org.openaccessbutton.openaccessbutton.HANDLE_PUSH"
	data[:customTitle] = params["title"]
	data[:type] = params["type"]
	data[:bigDescription] = params["bigDescription"]
	data[:url] = params["url"] if params["type"] == "url"

	push = Parse::Push.new data, "Users"
	push.type = "android"
	push.save
	
	erb :success
end
