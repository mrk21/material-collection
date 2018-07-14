require 'rails_helper'

RSpec.describe "Hoges", type: :request do
  let!(:hoge) { create :hoge, value: 'hoge', user: hoge_user }
  let!(:hoge_user) { create :user }

  describe 'GET /hoges/:id' do
    let(:id) { hoge.to_param }

    authentication_context do
      let(:hoge_user) { current_user }

      it 'returns hoge specified by :id' do
        is_expected.to eq 200

        expect(response.body).to be_json_as(
          hoge: {
            id: hoge.to_param,
            value: hoge.value,
          }
        )
      end
    end
  end
end
