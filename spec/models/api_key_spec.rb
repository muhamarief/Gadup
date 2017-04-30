require 'rails_helper'

RSpec.describe ApiKey, type: :model do

  let (:owner) { FactoryGirl.create(:user) }
  let (:api_key) { owner.api_keys.create }

  subject { api_key}

  it { is_expected.to respond_to(:access_token) }
  it { is_expected.to respond_to(:owner) }

  it { is_expected.to validate_presence_of(:access_token) }
  it { is_expected.to validate_presence_of(:owner) }
end
