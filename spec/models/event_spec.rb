require 'spec_helper'

describe Event do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:location) }
  it { should validate_presence_of(:date) }

  let(:event) { FactoryGirl.build(:event) }

  describe 'event_date_cannot_be_in_past validation' do
    it 'should return false for a past date' do
      event.date = DateTime.yesterday
      event.should_not be_valid
    end

    it 'should be valid with a future date' do
      event.date = DateTime.tomorrow
      event.should be_valid
    end
  end

end
