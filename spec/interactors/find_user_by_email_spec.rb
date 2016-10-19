require "rails_helper"

describe FindUserByEmail do
  subject(:interactor) { described_class.call(decorated_oauth: decorated_oauth) }

  describe "#call" do
    let!(:user) { create :user, email: decorated_oauth.email }

    context "when Identity has been successfully created" do
      let(:decorated_oauth) { build(:omniauth_hash) }
      let(:identity) { interactor.user.identities.first }

      it { is_expected.to be_success }
      it { expect(interactor.user).to eq user }
      it { expect(identity.provider).to eq decorated_oauth.provider }
      it { expect(identity.uid).to eq decorated_oauth.id }
    end

    context "when Identity was not created" do
      let(:decorated_oauth) { build(:omniauth_hash, provider: nil) }

      it { is_expected.to be_failure }
    end
  end
end
