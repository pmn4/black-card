require_relative 'users_controller'

class UserReward
  attr_accessor :user, :reward

  def initialize(user, reward)
    self.user = user
    self.reward = reward
  end

  def eligible
    [true, false].sample
  end

  def as_json(options = {})
    {
      reward: reward.as_json(options[:reward]),
      eligible: eligible
    }
  end

  class << self
    def from_array(user, rewards)
      rewards.map { |r| new(user, r) }
    end
  end
end

class UserRewardsController < UsersController
  def index
    user = find_or_create_user(params[:user_id])
    rewards = UserReward.from_array(user, application.rewards)

    render(json: rewards.as_json)
  end
end
