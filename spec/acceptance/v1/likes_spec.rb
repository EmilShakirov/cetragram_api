require "rails_helper"
require "rspec_api_documentation/dsl"

resource "Likes" do
  header "Accept", "application/json"

  subject(:response) { json_response_body }

  post "/v1/likes" do
    include_context "signed in user"

    parameter :image_id, "Image Id", required: true, scope: :like

    let(:image) { create :image }
    let(:image_id) { image.id }

    example_request "Like an image" do
      expect(response["like"]).to be_a_like_representation
    end
  end

  delete "/v1/likes/:id" do
    include_context "signed in user"

    parameter :id, "Like Id", required: true
    parameter :image_id, "Image Id", required: true, scope: :like

    let(:id) { like.id }
    let(:image_id) { image.id }
    let(:image) { create :image, user: user }
    let(:like) { create :like, image: image, user: user }
    let(:another_like) { create :like, image: image }
    let(:user) { create :user }

    example_request "Unlike an image" do
      expect(response["like"]).to be_a_like_representation
    end

    example_request "Unlike an image with non-existed id", id: 99 do
      expect(response_status).to eq 404
    end
  end
end
