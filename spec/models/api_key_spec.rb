require 'rails_helper'

RSpec.describe ApiKey, type: :model do

  let (:api_key) { create(:user_api_key ) }
  # let (:api_key) { FactoryGirl.create(:user_api_key) }


  subject { api_key }

  it { is_expected.to respond_to(:access_token) }
  it { is_expected.to respond_to(:owner) }

  it { is_expected.to validate_uniqueness_of(:access_token) }
  it { is_expected.to validate_presence_of(:owner) }

  it "generate access token every creation" do
    expect(api_key.access_token).to_not be_nil
  end
end
