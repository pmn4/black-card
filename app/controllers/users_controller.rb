require_relative '../models/user'

class UsersController < ApplicationController
  self.application_property = :users
  self.resource_param = :user
  self.model_class = User

  # /users/:id_or_alias_key
  def show
    raise ActiveRecord::RecordNotFound unless params[:id].present?

    render(json: find_or_create_user(params[:id]).as_json)
  rescue ActiveRecord::RecordNotFound
    render(text: 'User Id is required', status: 404)
  end

  protected

  def find_or_create_user(id_or_alias_key)
    @_find_or_create_user ||= begin
      find_user(id_or_alias_key) || create_user(id_or_alias_key)
    end
  end

  def find_user(id_or_alias_key)
    application.users.find(id_or_alias_key)
  rescue ActiveRecord::RecordNotFound
    user_aliases = Alias.select(:user_id).where(key: id_or_alias_key)

    application.users.where(id: user_aliases).limit(1).first
  end

  def create_user(alias_key)
    application.users.create(application: application).tap do |user|
      user.aliases << Alias.create(key: alias_key)
    end
  end
end
