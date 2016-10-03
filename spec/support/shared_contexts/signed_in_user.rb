shared_context "signed in user" do
  header "X-User-Email", :email
  header "X-User-Token", :token

  let(:email) { user.email }
  let(:token) { user.authentication_token }
  let(:user) { create :user }
end
