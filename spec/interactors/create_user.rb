require "rails_helper"

describe CreateUser do
  subject(:interactor) { described_class.call(decorated_oauth: decorated_oauth) }

  describe "#call" do
    context "when oauth contains valid user params" do
      let(:decorated_oauth) { build(:omniauth_hash) }
      let(:user) { interactor.user }

      it { is_expected.to be_success }
      it { expect(user.email).to eq decorated_oauth.email }
    end

    context "when oauth contains valid user params" do
      let(:decorated_oauth) { build(:omniauth_hash, email: nil) }

      it { is_expected.to be_failure }
    end
  end
end
