require 'rails_helper'

RSpec.describe HogePolicy do
  let(:hoge) { create :hoge }

  subject { described_class }

  permissions :show? do
    context 'when hoge.user == user' do
      it 'permits' do
        is_expected.to permit(hoge.user, hoge)
      end
    end

    context 'when hoge.user != user' do
      it 'does not permit' do
        is_expected.not_to permit(create(:user), hoge)
      end
    end
  end
end
