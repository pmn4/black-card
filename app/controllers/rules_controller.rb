require_relative '../models/rule'

class RulesController < ApplicationController
  self.application_property = :rules
  self.model_class = Rule
end
