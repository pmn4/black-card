require_relative '../models/alias'

class AliasesController < ApplicationController
  self.application_property = :aliases
  self.resource_param = :alias
  self.model_class = Alias
end
