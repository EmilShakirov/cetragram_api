RSpec::Matchers.define :be_a_like_representation do
  match do |json|
    response_attributes = %w(
      id
      image_id
      user_id
    )

    expect(json).to be
    expect(json.keys).to match_array(response_attributes)
  end
end
