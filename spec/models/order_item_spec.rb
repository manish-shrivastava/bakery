require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  it { is_expected.to have_many(:order_item_histories) }
  it { is_expected.to validate_numericality_of(:quantity) }

  let(:order_item) { FactoryGirl.create(:order_item) }

  describe "#real_evalucation" do
    it "finds the optimum change" do
      expect(order_item.send(:real_evalucation, 10, [5,3])).to     eq([5,5])
      expect(order_item.send(:real_evalucation, 14, [8,5,2])).to   eq([8,2,2,2])
      expect(order_item.send(:real_evalucation, 13, [9,5,3])).to   eq([5,5,3])
    end

  end
end
