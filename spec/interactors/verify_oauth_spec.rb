require "rails_helper"

describe VerifyOauth do
  subject(:interactor) { described_class.call(oauth_data: oauth_data) }

  describe "#call" do
    context "when oauth data is verified" do
      let(:oauth_data) { build(:omniauth_hash).to_h }
      let(:decorated_oauth) { interactor.decorated_oauth }

      it { is_expected.to be_success }
      it { expect(decorated_oauth).to be_a AuthProviders::FacebookDecorator }
    end

    context "when oauth data is not verified" do
      let(:oauth_data) { build(:omniauth_hash, :not_verified).to_h }

      it { is_expected.to be_failure }
    end
  end
end
