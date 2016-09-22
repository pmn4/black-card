require_relative 'users_controller'
require_relative '../models/action'

class UserActionsController < UsersController
  self.application_property = :actions
  self.resource_param = :user_action
  self.model_class = Action

  def create
    # dealwithit.gif
    params[self.class.resource_param][:params_json] =
      params[self.class.resource_param][:params].to_json

    subresource_create
  end
end
