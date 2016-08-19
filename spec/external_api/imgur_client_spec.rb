require "rails_helper"

describe ExternalApi::ImgurClient do
  include ActionDispatch::TestProcess

  let(:file) { fixture_file_upload("image.jpg", "image/jpg") }

  describe "#call" do
    let(:session) { double(:session) }
    let(:image) { double(:image) }

    after { described_class.call(file) }

    it "call Imgurapi client" do
      expect(Imgurapi::Session).to receive(:new).and_return(session)
      expect(session).to receive(:image).and_return(image)
      expect(image).to receive(:image_upload).with(file)
    end
  end
end
