require_relative '../models/user'

class UsersController < ApplicationController
  self.application_property = :users
  self.resource_param = :user
  self.model_class = User

  # /users/:id_or_alias_key
  def show
    halt(404, 'User Id is required') unless params[:id].present?

    render(json: find_or_create_user(params[:id]).as_json)
  end

  protected

  def find_or_create_user(id_or_alias_key)
    @_find_or_create_user ||= begin
      find_user(id_or_alias_key) || create_user(id_or_alias_key)
    end
  end

  private

  def find_user(id_or_alias_key)
    User.find(id_or_alias_key)
  rescue ActiveRecord::RecordNotFound
    user_alias = Alias.select(:user_id).where(key: id_or_alias_key)

    User.where(id: user_alias).limit(1).first
  end

  def create_user(alias_key)
    User.create(application: application).tap do |user|
      user.aliases << Alias.create(key: alias_key)
    end
  end
end
