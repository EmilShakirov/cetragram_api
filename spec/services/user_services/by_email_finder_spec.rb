require "rails_helper"

describe UserServices::ByEmailFinder do
  let(:auth_hash) { AuthProviders::FacebookDecorator.new(build(:omniauth_hash)) }
  let(:service) { described_class.new(auth_hash) }

  describe "#call" do
    subject { service.call }

    context "when user present" do
      let!(:user) { create(:user, email: auth_hash.email) }
      let(:identity) { user.identities.take }

      before { subject }

      it { expect(identity.user).to eq user }
      it { expect(identity.provider).to eq auth_hash.provider }
      it { expect(identity.uid).to eq auth_hash.id }
      it { is_expected.to eq user }
    end

    context "when user does not exist" do
      before { subject }

      it { is_expected.to be_nil }
    end
  end
end
