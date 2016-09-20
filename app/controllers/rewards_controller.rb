require_relative '../models/reward'

class RewardsController < ApplicationController
  self.application_property = :rewards
  self.model_class = Reward
end
