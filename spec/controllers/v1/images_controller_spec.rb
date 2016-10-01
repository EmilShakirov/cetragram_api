require "rails_helper"

describe V1::ImagesController, type: :request do
  describe "#POST create" do
    let(:image_params) do
      { image: { file: uploaded_file, caption: "Caption" } }
    end

    before do
      post v1_images_path, image_params, auth_headers
    end

    subject { response.status }

    it { is_expected.to eq 201 }
  end

  describe "#GET index" do
    before do
      get v1_images_path, {}, auth_headers
    end

    subject { response.status }

    it { is_expected.to eq 200 }
  end

  describe "#GET show" do
    let(:image) { create :image, file: fixture_file_upload("image.jpg", "image/jpg") }

    before do
      get v1_image_path(image), {}, auth_headers
    end

    subject { response.status }

    it { is_expected.to eq 200 }
  end
end
