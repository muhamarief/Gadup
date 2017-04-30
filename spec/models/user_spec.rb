require 'rails_helper'

RSpec.describe User, type: :model do

  context 'validation' do

    describe "user email and username validation" do
      it { is_expected.to validate_presence_of (:username) }
      it { is_expected.to validate_presence_of (:email) }
      it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    end

    describe "user password validation" do
      it { is_expected.to validate_presence_of (:password) }
      it { is_expected.to validate_confirmation_of(:password) }
      it { is_expected.to allow_value('example@domain.com').for(:email) }
    end
  end

  it { is_expected.to respond_to(:username) }
  it { is_expected.to respond_to(:email) }

  it { is_expected.to have_many(:api_keys) }
end
