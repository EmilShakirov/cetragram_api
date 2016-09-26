require "rails_helper"

describe V1::LikesController, type: :request do
  describe "#POST create" do
    let(:image) { create :image }
    let(:like_params) do
      { like: { image_id: image.id } }
    end

    before { post v1_likes_path, like_params, auth_headers }

    subject { response.status }

    it { is_expected.to eq 201 }
  end

  describe "#DELETE destroy" do
    let(:like) { create :like }
    let(:user) { like.user }

    before { delete v1_like_path(like), {}, auth_headers(user) }

    subject { response.status }

    it { is_expected.to eq 200 }
  end
end
