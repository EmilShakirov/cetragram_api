require "rails_helper"

describe Like do
  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:image) }
  end
end
