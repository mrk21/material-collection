# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Pundit

  class UnauthenticatedError < RuntimeError; end

  rescue_from UnauthenticatedError, with: :error_401

  protected

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
    raise UnauthenticatedError if @current_user.nil?
    @current_user
  end

  def error_401
    render json: { errors: [{ message: 'unauthenticated!' }] }, status: 401
  end
end
