require "rails_helper"

describe User do
  describe "associations" do
    it { is_expected.to have_many(:likes) }
    it { is_expected.to have_many(:images) }
  end
end
