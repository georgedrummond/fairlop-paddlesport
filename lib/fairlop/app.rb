require 'sinatra'
require 'sinatra/dalli'
require 'georgedrummond_sinatra_helpers'
require 'haml'
require 'sass'
require 'koala'

module Fairlop
  class Application < Sinatra::Base
    include GeorgeDrummond::Sinatra::Helpers

    register Sinatra::Dalli

    set :public_folder, File.join(File.dirname(__FILE__), 'public')
    set :views,         File.join(File.dirname(__FILE__), 'views')

    get '/' do
      @events = cache('facebook_events') { get_events rescue [] }
      haml :index
    end

    get '/css/app.css' do
      sass :app
    end

    get '*' do
      redirect('/')
    end

    def get_events
      group = ENV['facebook_group_id']
      oauth_access_token = ENV['facebook_oauth_token']
      graph = Koala::Facebook::API.new(oauth_access_token)
      graph.get_connections(group, 'events').map { |e| e = OpenStruct.new(e) }
    end
  end
end
