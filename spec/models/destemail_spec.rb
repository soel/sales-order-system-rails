require 'rails_helper'

RSpec.describe Destemail, :type => :model do
  it "email アドレスがあれば有効な状態であること" do
    expect(build(:destemail)).to be_valid
  end

  it "email アドレスがなければ無効な状態であること" do
    destemail = build(:destemail, email: nil)
    destemail.valid?
    expect(destemail.errors[:email]).to include("を入力してください。")
  end

  it "email アドレスが重複した場合は無効な状態であること" do
    create(:destemail)
    destemail = build(:destemail)
    destemail.valid?
    expect(destemail.errors[:email]).to include("はすでに存在します。")
  end
end
