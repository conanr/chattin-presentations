require 'logger'
require 'active_record'
require 'sinatra/base'

require 'models/invite.rb'
require 'models/presentation.rb'
require 'models/presentation_owner.rb'
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

  get '/presentations/:id/presenters' do
    id = params[:id].to_i
    presenter_ids = PresentationOwner.find_all_by_presentation_id(id).collect{|p| p.user_id}
    {"presenter_ids" => presenter_ids}.to_json
  end

  get '/presentations' do
    Presentation.all.to_json
  end

  post '/presentations' do
    begin
      presentation = Presentation.create(json_body)
      if presentation.new_record?
        error 400, { errors: [ presentation.message ] }.to_json
      else
        presentation
      end
    rescue => e
      error 400, { errors: [ e.message ] }.to_json
    end
  end

  post '/invites' do
    begin
      invite = Invite.create(json_body)
      invite
    rescue => e
      error 400, { errors: [ e.message ] }.to_json
    end
  end

  get '/invites' do
    Invite.all.to_json
  end
end
