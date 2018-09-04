# frozen_string_literal: true

module BaseResolver
  extend ActiveSupport::Concern

  def current_user
    context[:current_user][]
  rescue UnauthenticatedError => e
    pp e
    raise NotAuthenticated
  end

  def session
    context[:session][]
  end

  def authenticate!
    raise NotAuthenticated if current_user.nil?
  end

  def authorize(record, query)
    Pundit.authorize(current_user, record, query)
  rescue Pundit::NotAuthorizedError => e
    pp e
    raise Errors::NotAuthorizedError
  end

  def policy(record)
    Pundit.policy(current_user, record)
  end

  def policy!(record)
    Pundit.policy!(current_user, record)
  end

  def policy_scope(scope)
    Pundit.policy_scope(current_user, scope)
  end

  def policy_scope!(scope)
    Pundit.policy_scope!(current_user, scope)
  end
end
