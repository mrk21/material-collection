require 'rails_helper'

RSpec.describe Hoge, type: :model do
  describe '#value' do
    subject { build(:hoge, value: 'hoge').value }
    it { is_expected.to eq 'hoge' }
  end
end
