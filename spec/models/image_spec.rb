require "rails_helper"

describe Image do
  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:likes) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:link) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:user) }
  end
end
