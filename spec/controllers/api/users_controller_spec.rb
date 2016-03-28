require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do
  it { should route(:post, '/api/users').to(action: :create) }

  it { should route(:get, '/api/users/1').to(action: :show, id: 1) }

  it { should route(:get, '/api/rooms/1/users').to(action: :index, room_id: 1) }

  describe '#create.json' do
    let(:params) do
      {
        email: 'test@example.com',
        name: 'Test name',
        password: '12345678',
        password_confirmation: '12345678',
        phone: '+380971234567',
        gender: 'female'
      }
    end

    let(:user) { double }

    before { expect(User).to receive(:new).with(params).and_return(user) }

    before { expect(user).to receive(:save!) }

    before { post :create, user: params, format: :json }

    it { should render_template :create }
  end

  before { sign_in }

  describe '#index.json' do
    before { get :index, room_id: 34, format: :json }

    it { should render_template :index }
  end

  describe '#show.json' do
    before { get :show, id: 1, format: :json }

    it { should render_template :show }
  end

  describe '#parent' do
    let(:room) { stub_model Room }

    before { expect(subject).to receive(:params).and_return(room_id: 38) }

    before { expect(Room).to receive(:find).with(38).and_return(:room) }

    its(:parent) { should eq :room }
  end

  describe '#collection' do
    before do
      #
      # subject.parent.users -> :users
      #
      expect(subject).to receive(:parent) do
        double.tap { |a| expect(a).to receive(:users).and_return(:users) }
      end
    end

    its(:collection) { should eq :users }
  end

  describe '#resource' do
    before { expect(subject).to receive(:params).and_return(id: 1) }

    before { expect(User).to receive(:find).with(1).and_return(:user) }

    its(:resource) { should eq :user }
  end
end
