require 'rails_helper'

RSpec.describe User, type: :model do
  it "is invalid if email blank" do
    user = build(:user, email: "")
    expect(user).to_not be_valid
  end

  it "is invalid if password blank" do
    user = build(:user, password: "")
    expect(user).to_not be_valid
    user = build(:user)
    expect(user).to be_valid
  end
end
