require 'rails_helper'

RSpec.describe Ping, type: :model do
  it { should have_many(:votes) }

  it { should belong_to(:user).counter_cache(true) }

  it { should validate_presence_of :user }
end
