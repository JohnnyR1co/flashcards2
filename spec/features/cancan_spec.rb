require 'rails_helper'
require 'support/helpers/login_helper.rb'
require "cancan/matchers"
include LoginHelper

describe "User" do
  let(:user) { create(:user) }
  let(:ability) { AdminAbility.new(user) }

  it "when user is admin he can manage all" do
    user.add_role :admin
    ability.should be_able_to(:manage, :all)
  end

  it "when user is user he couldn't manage all" do
    user.add_role :user
    ability.should_not be_able_to(:manage, :all)
  end
end
