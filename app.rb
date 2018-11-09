require 'sinatra'
require "sinatra/json"
require 'digest'

configure {
  set :server, :puma
}

RUBY_MSG = "Ruby is Dead, Dead!!!".freeze

class Orelrb < Sinatra::Base
  get '/' do
    return 'Hi there from OrelRb'
  end

  post '/' do
    request.body.rewind
    payload = JSON.parse request.body.read
    first_name = "#{payload['first_name']} #{Digest::MD5.hexdigest(payload['first_name'])}"
    last_name = "#{payload['last_name']} #{Digest::MD5.hexdigest(payload['last_name'])}"

    result = { id: payload['id'], first_name: first_name, last_name: last_name, say: RUBY_MSG, current_time: Time.now.strftime("%F %T %z") }
    json result
  end

  run! if app_file == $0
end
