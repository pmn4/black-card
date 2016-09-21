require_relative '../models/reward'

class RewardsController < ApplicationController
  self.application_property = :rewards
  self.resource_param = :reward
  self.model_class = Reward

  protected

  def resource_id
    params[:reward_id]
  end
end
