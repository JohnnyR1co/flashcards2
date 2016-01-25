require "rails_helper"

describe "Checking roles" do
  let!(:user) { create(:user) }

  it "should not approve incorrect roles" do
    user.add_role :user
    expect(user.has_role?(:admin)).to eq(false)
  end

  it "should approve correct roles" do
    user.add_role :user
    expect(user.has_role?(:user)).to eq(true)
  end
end
