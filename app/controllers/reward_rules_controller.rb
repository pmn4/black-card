require_relative 'rewards_controller'
require_relative '../models/rule'

class RewardRulesController < RewardsController
  self.application_property = :rules
  self.resource_param = :rule
  self.model_class = Rule

  alias_method :index, :subresource_index
  alias_method :create, :subresource_create
  alias_method :update, :subresource_update
  alias_method :destroy, :subresource_destroy
end
