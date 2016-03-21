require 'rails_helper'

RSpec.describe UserObserver do
  describe '#after_create' do
    let(:user) { stub_model(User, valid?: true).as_new_record }

    before do
      #
      # WelcomeMailer.email(user).deliver_now
      #
      expect(WelcomeMailer).to receive(:email).with(user) do
        double.tap { |a| expect(a).to receive(:deliver_now) }
      end
    end

    it do
      ActiveRecord::Base.observers.enable :user_observer do
        expect { user.save }.to_not raise_error
      end
    end
  end
end
