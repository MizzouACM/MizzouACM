require 'spec_helper'

describe Hack do
  it { should have_and_belong_to_many(:users) }
end
