require_relative '../models/application'

class ApplicationsController < ApplicationController
  self.application_property = :applications
  self.resource_param = :application
  self.model_class = Application

  def create
    resource = Application.create!(resource_params)

    render(json: resource.as_json)
  rescue ActiveRecord::RecordInvalid => e
    render(json: e.record.errors, status: 400)
  rescue ActiveRecord::RecordNotUnique => e
    render(text: 'Duplicate entry', status: 409)
  end

  private

  def require_application
    # noop
  end
end
