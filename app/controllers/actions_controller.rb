require_relative '../models/action'

class ActionsController < ApplicationController
  self.application_property = :actions
  self.resource_param = :action
  self.model_class = Action
end
