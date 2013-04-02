require 'spec_helper'

describe User do

  it { should have_and_belong_to_many(:hacks) }

  describe '#is_admin?' do

    let(:user) { FactoryGirl.create(:user) }
    let(:admin) { FactoryGirl.create(:user, :admin => true) }

    it 'should return true if is_admin' do
      admin.is_admin?.should be_true
    end

    it 'should return false if not_admin' do
      user.is_admin?.should be_false
    end
  end
end
