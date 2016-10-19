require "rails_helper"
require "rspec_api_documentation/dsl"

resource "Ouath Users" do
  header "Accept", "application/json"

  subject(:response) { json_response_body }

  post "/v1/oauth_users" do
    include_context "signed in user"

    parameter :oauth_data, "Raw oauth hash", required: true, scope: :oauth_user

    let(:oauth_data) { build(:omniauth_hash).to_h }

    example_request "Create user from oauth data" do
      expect(response["user"]).to be_a_session_representation
    end
  end
end
