require "rails_helper"

describe FindUserByOauth do
  let(:decorated_oauth) { build(:omniauth_hash) }
  subject(:interactor) { described_class.call(decorated_oauth: decorated_oauth) }

  describe "#call" do
    context "when Identity is present" do
      let(:user) { create :user }
      let!(:identity) do
        create :identity,
          provider: decorated_oauth.provider,
          uid: decorated_oauth.id,
          user: user
      end

      it { is_expected.to be_success }
      it { expect(interactor.user).to eq user }
    end

    context "when Identity is absent" do
      it { is_expected.to be_success }
      it { expect(interactor.user).to be_nil }
    end
  end
end
