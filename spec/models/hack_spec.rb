require 'spec_helper'

describe Hack do

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }

  it { should have_and_belong_to_many(:users) }

end
