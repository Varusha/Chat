require 'rails_helper'

describe OrderDecorator, type: :decorator do
  describe '#as_json' do
    let(:order) { stub_model Order, id: 49, user_id: 1, total: 100500.25 }

    subject { order.decorate.as_json.symbolize_keys }

    its([:id]) { should eq 49 }

    its([:user_id]) { should eq 1 }

    its([:total]) { should eq 100500.25 }
  end
end
