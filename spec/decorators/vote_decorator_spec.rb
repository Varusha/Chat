require 'rails_helper'

describe VoteDecorator, type: :decorator do
  describe '#as_json' do
    let(:vote) { stub_model Vote, id: 1, kind: 0, user_id: 1 }

    subject { vote.decorate.as_json.symbolize_keys }

    its([:id]) { should eq 1 }

    its([:kind]) { should eq 'like' }

    its([:user_id]) { should eq 1 }
  end
end
