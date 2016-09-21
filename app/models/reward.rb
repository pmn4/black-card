class Reward < ActiveRecord::Base
  def serializable_hash(options = {})
    return super if options.present?

    super(only: %i(name description))
  end
end
