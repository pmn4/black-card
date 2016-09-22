require_relative 'users_controller'
require_relative '../models/alias'

class UserAliasesController < UsersController
  self.application_property = :aliases
  self.resource_param = :alias
  self.model_class = Alias

  alias_method :create, :subresource_create
end
