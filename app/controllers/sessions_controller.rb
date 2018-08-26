# frozen_string_literal: true

class SessionsController < ApplicationController
  def show
    render json: { user: { id: current_user.to_param, email: current_user.email } }
  end

  def create
    user = User.find_by(email: permit_params[:email])
    raise UnauthenticatedError unless user.present? && user.authenticate(permit_params[:password])
    session[:user_id] = user.id
    render json: { user: { id: user.to_param, email: user.email } }, status: 201
  end

  def destroy
    session.delete(:user_id)
    render status: 204
  end

  private

  def permit_params
    params.require(:user).permit(:email, :password)
  end
end
