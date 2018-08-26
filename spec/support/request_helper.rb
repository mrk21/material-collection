# frozen_string_literal: true

module RequestHelper
  extend ActiveSupport::Concern

  class_methods do
    def authentication_context(&block)
      context 'with authentication' do
        let(:current_user) { create(:user) }

        before do
          post session_path, params: {
            user: {
              email: current_user.email,
              password: current_user.password,
            }
          }
        end

        instance_eval(&block)
      end

      context 'without authentication' do
        it 'returns 401' do
          is_expected.to eq 401
        end
      end
    end
  end
end
