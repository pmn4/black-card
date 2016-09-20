require_relative '../models/application'

class ApplicationController < ActionController::API
  before_action :require_application

  attr_accessor :application

  def index
    resources = application.send(application_property)

    render(json: resources.as_json)
  end

  def read
    resource = application.send(application_property).find(params[:id])

    render(json: resource.as_json)
  end

  protected

  def application_property
    self.class.application_property
  end

  private

  def require_application
    halt(400, 'application_id is required') unless params.key?(:application_id)

    self.application = Application.find(params[:application_id])
  rescue => e
    halt(400, "Unknown Application `#{ params[:application_id] }`")
  end

  class << self
    attr_accessor :model_class
  end
end
