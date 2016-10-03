require "rails_helper"
require "rspec_api_documentation/dsl"

resource "Images" do
  header "Accept", "application/json"

  subject(:response) { json_response_body }

  get "/v1/images" do
    include_context "signed in user"

    parameter :page, required: false
    parameter :per_page, required: false

    let!(:images) { [create(:image)] }
    let(:page) { 1 }
    let(:per_page) { 24 }

    example_request "List images" do
      expect(response["images"].first).to be_a_image_representation
      expect(response).to be_a_meta_representation_of(images, params)
    end
  end

  post "/v1/images" do
    include_context "signed in user"

    parameter :file, "File", required: true, scope: :image
    parameter :caption, "Caption", required: false, scope: :image

    let(:file) { uploaded_file }

    example_request "Create image" do
      expect(response["image"]).to be_a_image_representation
    end
  end
end
