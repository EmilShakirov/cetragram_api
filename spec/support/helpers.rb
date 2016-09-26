module Helpers
  def json_response_body
    parse_json(response_body)
  end

  def auth_headers(user = nil)
    user ||= FactoryGirl.create(:user)

    {
      "X-User-Email" => user.email,
      "X-User-Token" => user.authentication_token
    }
  end
end
