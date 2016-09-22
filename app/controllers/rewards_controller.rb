require_relative '../models/reward'

class RewardsController < ApplicationController
  self.application_property = :rewards
  self.resource_param = :reward
  self.model_class = Reward

  def subresource_create
    user = Reward.find(params[:reward_id])

    raise ActiveRecord::RecordNotFound unless user.present?

    resource = user.send(self.class.application_property)
      .create!(resource_params)

    render(json: resource.as_json)
  rescue ActiveRecord::RecordNotFound
    render(text: 'Not found', status: 404)
  rescue ActiveRecord::RecordInvalid => e
    render(json: e.record.errors, status: 400)
  rescue ActiveRecord::RecordNotUnique => e
    render(text: 'Duplicate entry', status: 409)
  end

  protected

  def resource_id
    params[:reward_id]
  end
end
