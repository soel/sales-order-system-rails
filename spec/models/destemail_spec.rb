require 'rails_helper'

RSpec.describe Destemail, :type => :model do
  it "email アドレスがあれば有効な状態であること" do
    destemail = Destemail.new(
      email: 'test@example.com')
    expect(destemail).to be_valid
  end
  
  it "email アドレスがなければ無効な状態であること" do
    destemail = Destemail.new(email: nil)
    destemail.valid?
    expect(destemail.errors[:email]).to include("を入力してください。")
  end
  
  it "email アドレスが重複した場合は無効な状態であること" do
    Destemail.create(
      email: 'test@example.com'
    )
    destemail = Destemail.new(
      email: 'test@example.com'
    )
    destemail.valid?
    expect(destemail.errors[:email]).to include("はすでに存在します。")
  end
end
