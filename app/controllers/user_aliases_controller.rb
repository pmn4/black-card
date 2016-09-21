require_relative 'users_controller'
require_relative '../models/alias'

class UserAliasesController < UsersController
  self.application_property = :aliases
  self.resource_param = :alias
  self.model_class = Alias

  def create
    resource = find_user(params[:user_id])

    raise ActiveRecord::RecordNotFound unless resource.present?

    resource.aliases.create!(resource_params)

    render(json: resource.as_json)
  rescue ActiveRecord::RecordNotFound
    render(text: 'Not found', status: 404)
  rescue ActiveRecord::RecordInvalid => e
    render(json: e.record.errors, status: 400)
  rescue ActiveRecord::RecordNotUnique => e
    render(text: 'Duplicate entry', status: 409)
  end
end
