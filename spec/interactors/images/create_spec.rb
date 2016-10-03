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
    context "successful upload" do
      let(:imgur_image) { build :imgur_image }

      it { is_expected.to be_success }
      it { expect(image.file_url).to match("/uploads/cache/") }
      it { expect(image.caption).to eq("Caption") }
    end

    context "failure upload" do
      let(:image_params) do
        {
          file: nil
        }
      end

      it { is_expected.to be_failure }
    end
  end
end
