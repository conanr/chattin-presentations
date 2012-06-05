require 'logger'
require 'active_record'
require 'sinatra/base'

require 'models/presentation.rb'
require 'helpers'
require 'config'

class Service < Sinatra::Base
  helpers  Helpers

  configure do
    databases = YAML.load_file("config/database.yml")
    ActiveRecord::Base.establish_connection(databases[Config.env])

    if Config.development?
      ActiveRecord::Base.logger = Logger.new(STDOUT)
    end
  end

  mime_type :json, "application/json"

  before do
    content_type :json
  end

  get '/presentations/:id' do
    id = params[:id].to_i
    Presentation.where(id: id).first.to_json
  end

  get '/presentations' do
    Presentation.all.to_json
  end

  post '/presentations' do
    Presentation.create!(json_body).to_json
  end
end
