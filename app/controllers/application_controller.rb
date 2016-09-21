require_relative '../models/application'

class ApplicationController < ActionController::API
  before_action :require_application

  class << self
    attr_accessor :model_class, :application_property, :resource_param
  end

  attr_accessor :application

  def index
    resources =
      application.send(application_property)

    render(json: resources.as_json)
  end

  def create
    resource =
      application.send(application_property).create!(resource_params)

    render(json: resource.as_json)
  rescue ActiveRecord::RecordInvalid => e
    render(json: e.record.errors, status: 400)
  rescue ActiveRecord::RecordNotUnique => e
    render(text: 'Duplicate entry', status: 409)
  end

  def show
    resource =
      application.send(application_property).find(params[:id])

    render(json: resource.as_json)
  end

  protected

  def application_property
    self.class.application_property
  end

  def resource_params
    params
      .require(self.class.resource_param)
      .permit(self.class.model_class.column_names)
  end

  private

  def require_application
    halt(400, 'application_key is required') unless params.key?(:application_key)

    self.application =
      Application.where(key: params[:application_key]).limit(1).first
  rescue => e
    halt(400, "Unknown Application `#{ params[:application_key] }`")
  end
end
