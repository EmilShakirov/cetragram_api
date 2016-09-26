require "rails_helper"

describe ImgurClient do
  describe "#call" do
    let(:file) { uploaded_file }
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
