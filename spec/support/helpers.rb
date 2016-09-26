module Helpers
  def auth_headers(user = nil)
    user ||= FactoryGirl.create(:user)

    {
      "X-User-Email" => user.email,
      "X-User-Token" => user.authentication_token
    }
  end

  def json_response_body
    parse_json(response_body)
  end

  def stub_imgur_upload(imgur_image = nil)
    imgur_image ||= build :imgur_image
    allow(ImgurClient).to receive(:call).and_return(imgur_image)
  end

  def uploaded_file
    fixture_file_upload("image.jpg", "image/jpg")
  end
end
