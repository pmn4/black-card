class Rule < ActiveRecord::Base
  after_initialize :init

  def init
    self.action_count ||= 1
  end
end
