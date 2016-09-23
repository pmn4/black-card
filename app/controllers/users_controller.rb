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

  def subresource_create
    user = find_or_create_user(params[:user_id])

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

  def subresource_destroy
    self.model_class.find(params[:user_id])
      .send(self.class.application_property)
      .destroy(params[:id])
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

    application.users.find_by(id: user_aliases)
  end

  def create_user(alias_key)
    application.users.create(application: application).tap do |user|
      user.aliases << Alias.create(key: alias_key)
    end
  end
end
