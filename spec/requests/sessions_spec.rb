# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  let!(:user) { create :user, email: 'user@example.com', password: 'password' }

  describe 'POST /api/session' do
    let :params do
      {
        user: {
          email: 'user@example.com',
          password: 'password',
        }
      }
    end

    context 'when auth params is valid' do
      it 'succeeds logged in' do
        is_expected.to eq 201

        expect(response.body).to be_json_as(
          user: {
            id: user.to_param,
            email: user.email,
          }
        )
      end
    end

    context 'when auth params is invalid' do
      let :params do
        {
          user: {
            email: 'user@example.com',
            password: 'invalid-password',
          }
        }
      end

      it 'failes logged in' do
        is_expected.to eq 401

        expect(response.body).to be_json_as(
          errors: [{
            message: 'unauthenticated!',
          }]
        )
      end
    end
  end

  describe 'GET /api/session' do
    context 'when access before logged in' do
      it 'returns 401' do
        is_expected.to eq 401

        expect(response.body).to be_json_as(
          errors: [{
            message: 'unauthenticated!',
          }]
        )
      end
    end

    context 'when access after logged in' do
      before do
        post session_path, params: { user: { email: 'user@example.com', password: 'password' } }
      end

      it 'returns logged in user' do
        is_expected.to eq 200

        expect(response.body).to be_json_as(
          user: {
            id: user.to_param,
            email: user.email,
          }
        )
      end
    end
  end

  describe 'DELETE /api/session' do
    context 'when access before logged in' do
      it 'returns 200' do
        is_expected.to eq 204

        get session_path
        expect(response.status).to eq 401
      end
    end

    context 'when access after logged in' do
      before do
        post session_path, params: { user: { email: 'user@example.com', password: 'password' } }
      end

      it 'returns 200' do
        is_expected.to eq 204

        get session_path
        expect(response.status).to eq 401
      end
    end
  end
end
