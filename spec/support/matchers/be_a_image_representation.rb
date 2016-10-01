RSpec::Matchers.define :be_a_image_representation do
  match do |json|
    response_attributes = %w(
      id
      caption
      link
      likes
    )

    expect(json).to be
    expect(json.keys).to match_array(response_attributes)
  end
end
