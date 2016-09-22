require_relative '../models/reward'

class RewardsController < ApplicationController
  self.application_property = :rewards
  self.resource_param = :reward
  self.model_class = Reward

  def subresource_index
    resources = reward.send(self.class.application_property)

    render(json: resources.as_json)
  rescue ActiveRecord::RecordNotFound
    render(text: 'Not found', status: 404)
  end

  def subresource_create
    resource = reward.send(self.class.application_property)
      .create!(resource_params)

    render(json: resource.as_json)
  rescue ActiveRecord::RecordNotFound
    render(text: 'Not found', status: 404)
  rescue ActiveRecord::RecordInvalid => e
    render(json: e.record.errors, status: 400)
  rescue ActiveRecord::RecordNotUnique => e
    render(text: 'Duplicate entry', status: 409)
  end

  def subresource_update
    resource = reward.send(self.class.application_property)
      .find(params[:id])

    resource.update!(resource_params)

    render(json: resource.as_json)
  rescue ActiveRecord::RecordNotFound
    render(text: 'Not found', status: 404)
  rescue ActiveRecord::RecordInvalid => e
    render(json: e.record.errors, status: 400)
  rescue ActiveRecord::RecordNotUnique => e
    render(text: 'Duplicate entry', status: 409)
  end

  def subresource_destroy
    reward
      .send(self.class.application_property)
      .destroy(params[:id])
  end

  protected

  def reward
    application.rewards.find(params[:reward_id])
  end

  def resource_id
    params[:reward_id]
  end
end
