require "rails_helper"

describe Images::Create do
  let(:user) { create :user }
  let(:image_params) do
    {
      file: uploaded_file, caption: "Caption"
    }
  end
  subject(:interactor) { described_class.call(params: image_params, user: user) }
  let(:image) { interactor.image }

  describe "#call" do
    before { stub_imgur_upload(imgur_image) }

    context "successful upload" do
      let(:imgur_image) { build :imgur_image }

      it { is_expected.to be_success }
      it { expect(image.name).to eq("image.jpg") }
      it { expect(image.link).to eq(imgur_image.link) }
    end

    context "failure upload" do
      let(:imgur_image) { build :imgur_image, link: nil }

      it { is_expected.to be_failure }
    end
  end
end
