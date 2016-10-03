require "rails_helper"

describe Image do
  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:likes) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:file_data) }
    it { is_expected.to validate_presence_of(:user) }
  end
end
