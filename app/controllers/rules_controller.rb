require_relative '../models/rule'

class RulesController < ApplicationController
  self.application_property = :rules
  self.resource_param = :rule
  self.model_class = Rule
end
