require 'rails_helper'

describe Api::V1::UsersController do

  describe 'GET #new' do

    def do_request
      get :new, format: :json
    end

    context 'user sign up form' do
      before do
        do_request
      end

      it { is_expected.to respond_with 200 }
      it { expect(response).to render_template('new') }
      it { expect(response).to render_template('_user') }
    end
  end

  describe 'POST #create' do

    def do_request
      post :create, format: :json
    end

    describe 'Success Path' do
      context "when email has not been taken" do
        When(:user) { User.create(username: "Muhamad Arief Rahman", email: "example@example.com", password: "123456", password_confirmation: "123456") }
        Then { user.valid? == true }
      end
    end

    describe 'Unsuccessfull Path' do
      context "when email has been taken" do
        let(:user) { create :user }
        When(:same_user) { User.create(username: "Muhamad Arief Rahman", email: user.email, password: "123456", password_confirmation: "123456") }
        Then { same_user.valid? == false }
      end

      context "when password and password_confirmation is not matched" do
        When(:user) { User.create(username: "Muhamad Arief Rahman", email: "example@example.com", password: "123456", password_confirmation: "1234565") }
        Then { user.valid? == false }
      end

      context "when username is empty" do
        When(:user) { User.create(email: "example@example.com", password: "123456", password_confirmation: "123456") }
        Then { user.valid? == false }
      end

      context "when password is empty" do
        When(:user) { User.create(username: "Muhamad Arief Rahman", email: "example@example.com", password_confirmation: "123456") }
        Then { user.valid? == false }
      end
    end
  end
end
