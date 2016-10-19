require "rails_helper"

describe FindOrCreateUser do
  let(:decorated_oauth) { build(:omniauth_hash) }
  subject(:interactor) { described_class.call(decorated_oauth: decorated_oauth) }

  shared_examples_for "user has identities" do
    let(:identity) { interactor.user.identities.first }
    it { expect(identity.provider).to eq decorated_oauth.provider }
    it { expect(identity.uid).to eq decorated_oauth.id }
  end

  describe "#call" do
    let(:identity) { interactor.user.identities.first }

    context "when oauth contains invalid email" do
      let(:decorated_oauth) { build(:omniauth_hash, email: nil) }

      it { is_expected.to be_failure }
    end

    context "when oauth contains invalid email" do
      let(:decorated_oauth) { build(:omniauth_hash, provider: nil) }

      it { is_expected.to be_failure }
    end

    describe "#user_by_identity" do
      let(:user) { create :user }
      let!(:identity) do
        create :identity,
          provider: decorated_oauth.provider,
          uid: decorated_oauth.id,
          user: user
      end

      it { is_expected.to be_success }
      it { expect(interactor.user).to eq user }
      it_behaves_like "user has identities"
    end

    describe "#user_by_email" do
      let!(:user) { create :user, email: decorated_oauth.email }

      it { is_expected.to be_success }
      it { expect(interactor.user).to eq user }
      it_behaves_like "user has identities"
    end

    describe "#user_by_email" do
      let(:user) { interactor.user }

      it { is_expected.to be_success }
      it { expect(user.email).to eq decorated_oauth.email }
      it_behaves_like "user has identities"
    end
  end
end
