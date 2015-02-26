require 'rails_helper'

RSpec.describe Destgroup, :type => :model do
  describe "リレーションシップの確認" do
    it { should have_and_belong_to_many (:destemails)}
    it { should have_and_belong_to_many (:orders)}
  end

  describe "destgroup のデータバリデーション" do

    describe "#name" do
      it "必須であること" do
        should validate_presence_of(:name)
      end
      it "一意であること" do
        should validate_uniqueness_of(:name)
      end
    end
  end
end
