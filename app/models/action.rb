class Action < ActiveRecord::Base
  validates :user_id, presence: true
  validates :action_type, presence: true
  validates :action_value, presence: true

  def params
    JSON.parse(params_json, symbolize_keys: true)
  rescue
    nil
  end

  def serializable_hash(options = {})
    super(except: :params_json, methods: :params)
  end
end
