class Rule < ActiveRecord::Base
  after_initialize :init

  def init
    self.action_count ||= 1
  end

  def satisfied?(user)
    user_action_count = user.actions
      .select { |a| a.action_type == action_type }
      .uniq(&:action_value)
      .length

    user_action_count >= action_count
  end
end
